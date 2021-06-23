//
//  AddView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI
import Introspect

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        self.text = text
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(NSLocalizedString(title, comment: ""))
                .font(.caption)
                .foregroundColor(Color(UIColor.systemGray))
                .opacity(text.wrappedValue.isEmpty ? 0 : 1)
                .offset(x: 10, y: text.wrappedValue.isEmpty ? 20 : 5)
            TextField(NSLocalizedString(title, comment: ""), text: text)
        }.animation(.default)
    }
    
    static func introspectTextField(_ textField: UITextField) {
        let bundle = Bundle.init(for: UIButton.self)
        let doneTitle = bundle.localizedString(forKey: "Done", value: nil, table: nil)
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textField.frame.size.width, height: 44))
        let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: NSLocalizedString(doneTitle, comment: ""), style: .done, target: self, action: #selector(textField.doneButtonTapped(button:)))
        doneButton.tintColor = .systemGreen
        toolBar.items = [flexButton, doneButton]
        toolBar.setItems([flexButton, doneButton], animated: true)
        textField.inputAccessoryView = toolBar
    }
}

extension  UITextField {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
        self.resignFirstResponder()
    }
}

struct AddView: View {
    private struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .padding(10)
        }
    }
    
    private let fontSize: CGFloat = 24
    @State var showInfoModalView: Bool = false
    @State private var name: String = ""
    @State private var bank: String = ""
    @State private var sum: String = ""
    @State private var interest: String = ""
    @State private var term: String = ""
    @Binding var credits: [Credit]
    
    init(credits: Binding<[Credit]>) {
        UITableView.appearance().backgroundColor = .clear
        UITextField.appearance().clearButtonMode = .whileEditing
        _credits = credits
    }
    
    var body: some View {
        let sumBinding = Binding<String>(get: {
            sum
        }, set: {
            sum = $0
        })
        
        let interestBinding = Binding<String>(get: {
            interest
        }, set: {
            interest = $0
        })
        
        NavigationView {
            List {
                FloatingTextField("addView.credit.name", text: $name)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.default)
                    .font(Font.system(size: fontSize, design: .default))
                    .foregroundColor(.primary)
                FloatingTextField("addView.credit.bank", text: $bank)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.default)
                    .font(Font.system(size: fontSize, design: .default))
                    .foregroundColor(.primary)
                FloatingTextField("addView.credit.sum", text: sumBinding)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .font(Font.system(size: fontSize, design: .default))
                    .foregroundColor(.primary)
                    .introspectTextField(customize: { textField in
                        FloatingTextField.introspectTextField(textField)
                    })
                FloatingTextField("addView.credit.interest", text: interestBinding)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .font(Font.system(size: fontSize, design: .default))
                    .foregroundColor(.primary)
                    .introspectTextField(customize: { textField in
                        FloatingTextField.introspectTextField(textField)
                    })
                FloatingTextField("addView.credit.term", text: $term)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .font(Font.system(size: fontSize, design: .default))
                    .foregroundColor(.primary)
                    .introspectTextField(customize: { textField in
                        FloatingTextField.introspectTextField(textField)
                    })
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("addView.title")
            .navigationBarItems(
                leading: Button(action: {
                    showInfoModalView.toggle()
                }) {
                    Image(systemName: "info.circle").scaleEffect(1.2)
                },
                trailing: Button("addView.next") {
                    nextButton()
                }
            )
            .sheet(isPresented: $showInfoModalView) {
                InfoView(isPresented: $showInfoModalView)
            }
        }
    }
    
    private func nextButton() {
        let sum = Int(sum) ?? 0
        let interest = Float(interest.replacingOccurrences(of: ",", with: ".")) ?? 0
        let term = Int(term) ?? 0
        let credit = Credit(name: name, bank: bank, sum: sum, interest: interest, term: term)
        credits.append(credit)
    }
}
