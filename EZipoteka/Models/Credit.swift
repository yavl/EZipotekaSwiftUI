//
//  Credit.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import Foundation

struct Credit: Identifiable {
    var id = UUID()
    var sum: Int?
    var interest: Float?
    var name = ""
}
