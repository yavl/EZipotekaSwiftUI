//
//  CreditRow.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 23.05.2021.
//

import SwiftUI

struct CreditRow: View {
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
        
        NavigationLink(destination: CreditView(credit: credit)) {
            HStack {
                VStack {
                    Text("\(formatter.string(from: NSNumber(value: credit.interest))!)%").foregroundColor(.green).font(.system(size: 26))
                    Text("\(credit.sum) ₽").foregroundColor(.gray).font(.system(size: 12))
                }
                
                VStack(alignment: .leading) {
                    Text("\(credit.name)").padding(1)
                    Text("\(credit.bank)").foregroundColor(.gray).font(.system(size: 12)).padding(1)
                }
            }
        }.frame(height: 80)
    }
}
