//
//  ListView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI

struct ListView: View {
    
    var body: some View {
        
        let credits = [
            Credit(name: "ЖК Чистое небо - Студия", bank: "Банк Санкт-Петербург", sum: 2800000, interest: 5.85),
            Credit(name: "ЖК Солнечный город - Студия", bank: "СберБанк", sum: 12800000, interest: 5.85)
        ]

        NavigationView {
            List {
                ForEach(credits, id: \.self) {
                    CreditRow(credit: $0)
                }
                .onDelete(perform: { indexSet in
                    print("delete")
                })
            }
            .navigationTitle("tab.list.title")
            .toolbar {
                NavigationLink(destination: TrashView()) {
                    Image(systemName: "trash")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // a workaround for swipe back cancel issue
    }
    
    private func onSave() {
        
    }
    
    private func onRemove() {
        print("asd")
    }
}
