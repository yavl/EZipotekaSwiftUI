//
//  SettingsView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            List {
                Button("Crash app") {
                    fatalError()
                }
                Text("asik")
                Text("asik")
                Text("asik")
            }
            .navigationTitle("Настройки")
        }
    }
}
