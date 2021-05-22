//
//  CreditRow.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 23.05.2021.
//

import SwiftUI
import SwipeCell

struct CreditRow: View {
    var credit: Credit
    
    var body: some View {
        let favoriteButton = SwipeCellButton(buttonStyle: .titleAndImage, title: "Сохранить", systemImage: "bookmark", view: nil, backgroundColor: .yellow, action: onSave)
        let removeButton = SwipeCellButton(buttonStyle: .titleAndImage, title: "Удалить", systemImage: "trash", titleColor: .white, imageColor: .white, view: nil, backgroundColor: .red, action: onRemove, feedback:true )
        
        let leftSlot = SwipeCellSlot(slots: [favoriteButton], slotStyle: .normal, buttonWidth: 100)
        let rightSlot = SwipeCellSlot(slots: [removeButton], slotStyle: .destructive, buttonWidth: 100)
        let width = UIScreen.main.bounds.width
        
        NavigationLink(destination: CreditView()) {
            Text("\(credit.name)")
        }.swipeCell(cellPosition: .both, leftSlot: leftSlot, rightSlot: rightSlot).frame(width: width, height: 90)
    }
    
    private func onSave() {
        
    }
    
    private func onRemove() {
        print("asd")
    }
}
