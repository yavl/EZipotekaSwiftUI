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
                    .font(.system(size: 36))
                Text("\(credit.sum) ₽")
                Text("\(credit.term) лет")
                Text("\(credit.bank)")
                Text("\(credit.name)")
            }
        }
        .padding(.top, 1)
        .navigationBarTitle(credit.name, displayMode: .automatic)
    }
}
