//
//  AddView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI

struct AddView: View {
    private struct MyTextFieldStyle: TextFieldStyle {
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
            .padding(15)
        }
    }

    @State private var sum: Int?
    @State private var interest: Int?
    
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
                TextField("Сумма кредита", value: $sum, formatter: formatter)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.numberPad)
                    .font(Font.system(size: 30, design: .default))
                    .foregroundColor(.gray)
                TextField("Процентная ставка", value: $interest, formatter: formatter)
                    .textFieldStyle(MyTextFieldStyle())
                    .keyboardType(.numberPad)
                    .font(Font.system(size: 30, design: .default))
                    .foregroundColor(.gray)
            }.onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
            .navigationTitle("Добавить кредит")
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
