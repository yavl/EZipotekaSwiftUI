//
//  CreditView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 23.05.2021.
//

import SwiftUI

struct CreditView: View {
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.roundingMode = .halfUp
        formatter.groupingSize = 3
        return formatter
    }()
    
    var credit: Credit
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("\(formatter.string(from: NSNumber(value: credit.interest))!)%")
                    .font(.system(size: 36)).foregroundColor(.green)
                Text("\(credit.sum) ₽")
                Text("\(credit.term) лет")
                Text("\(credit.bank)")
                Text("\(credit.name)")
                Divider()
                Text("Ежемесячный платеж: \(monthlyPayment())")
            }
        }
        .padding(.top, 1)
        .navigationBarTitle(credit.name, displayMode: .automatic)
    }
    
    private func monthlyPayment() -> String {
        let S = Double(credit.sum)
        let r = credit.interest / 100 / 12
        let n = credit.term * 12
        let pows = Double(pow(1 + r, Double(n)))
        let payment = S * (r * pows) / (pows - 1)
        return "\(formatter.string(from: NSNumber(value: payment))!) ₽"
    }
}
