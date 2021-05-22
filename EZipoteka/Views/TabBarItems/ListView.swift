//
//  ListView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI
import SwipeCell

struct ListView: View {
    
    var body: some View {
        let credits = [
            Credit(sum: 2800000, interest: 5, name: "квартира"),
            Credit(sum: 2800000, interest: 5, name: "квартирaа")
        ]

        NavigationView {
            List(credits) { credit in
                CreditRow(credit: credit)
            }
            .navigationTitle("Список кредитов")
        }
    }
    
    private func onSave() {
        
    }
    
    private func onRemove() {
        print("asd")
    }
}