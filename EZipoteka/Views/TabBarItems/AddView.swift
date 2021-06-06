//
//  AddView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    let text: Binding<String>

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(text.wrappedValue.isEmpty ? 0 : 1)
                .offset(x: 20, y: text.wrappedValue.isEmpty ? 20 : 0)
            TextField(title, text: text)
        }.animation(.default)
    }
}

struct AddView: View {
    private struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding(15)
        }
    }

    @State private var sum: Int?
    @State private var interest: Int?
    @State private var firstName: String = ""
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 3
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = " "
        return formatter
    }()
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        NavigationView {
            List {
                FloatingTextField(title: "addView.credit.name", text: $firstName)
                    .textFieldStyle(MyTextFieldStyle())
                TextField("addView.credit.sum", value: $sum, formatter: formatter)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.numberPad)
                    .font(Font.system(size: 30, design: .default))
                    .foregroundColor(.gray)
                TextField("addView.credit.interest", value: $interest, formatter: formatter)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.numberPad)
                    .font(Font.system(size: 30, design: .default))
                    .foregroundColor(.gray)
            }
            .navigationTitle("tab.add.title")
            .toolbar(content: {
                Button("Далее") {
                    nextButton()
                }
            })
        }
    }
    
    private func nextButton() {
        
    }
}
