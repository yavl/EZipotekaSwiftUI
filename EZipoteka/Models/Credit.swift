//
//  Credit.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import Foundation

struct Credit: Identifiable, Hashable {
    var id = UUID()
    var name = ""
    var bank = ""
    var sum: Int
    var interest: Float
}
