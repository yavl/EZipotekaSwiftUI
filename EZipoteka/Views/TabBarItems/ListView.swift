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
                        .contextMenu(ContextMenu(menuItems: {
                            /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                            /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                            /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                        }))
                }
                .onDelete(perform: { indexSet in
                    onRemove(at: indexSet)
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
    
    private func onSave() {
        
    }
    
    private func onRemove(at offsets: IndexSet) {
        credits.remove(atOffsets: offsets)
    }
}
