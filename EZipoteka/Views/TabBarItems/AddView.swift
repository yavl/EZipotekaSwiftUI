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
        doneButton.tintColor = .systemBlue
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
    
    @State private var name: String = ""
    @State private var bank: String = ""
    @State private var sum: String = ""
    @State private var interest: String = ""
    
    private let fontSize: CGFloat = 24
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITextField.appearance().clearButtonMode = .whileEditing
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
            }
            .navigationTitle("tab.add.title")
            .toolbar(content: {
                Button("addView.next") {
                    nextButton()
                }
            })
        }
    }
    
    private func nextButton() {
        
    }
}
