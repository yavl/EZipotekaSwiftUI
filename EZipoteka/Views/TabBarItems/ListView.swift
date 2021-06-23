//
//  ListView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI

struct ListView: View {
    @Binding var credits: [Credit]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(credits, id: \.self) { credit in
                    CreditRow(credit: credit)
                }
                .onDelete(perform: { indexSet in
                    credits.remove(atOffsets: indexSet)
                })
                if credits.isEmpty {
                    Text("empty")
                }
            }
            .navigationTitle("listView.title")
            .toolbar {
                NavigationLink(destination: TrashView()) {
                    Image(systemName: "trash")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // a workaround for swipe back cancel issue
    }
}
