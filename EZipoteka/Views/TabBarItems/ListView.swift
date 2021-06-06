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
            Credit(sum: 2800000, interest: 5.85, name: "ЖК Чистое небо - Студия"),
            Credit(sum: 2800000, interest: 5.85, name: "ЖК Солнечный город - Студия")
        ]

        NavigationView {
            List(credits) { credit in
                CreditRow(credit: credit)
            }
            .navigationTitle("tab.list.title")
        }
    }
    
    private func onSave() {
        
    }
    
    private func onRemove() {
        print("asd")
    }
}
