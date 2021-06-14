//
//  ContentView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI
import AppTrackingTransparency

struct ContentView: View {
    var body: some View {
        TabView() {
            ListView()
                .tabItem {
                    Image(systemName: "rectangle.grid.1x2")
                    Text("Список")
                }
            AddView()
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("Добавить")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Настройки")
                }
        }
        .accentColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
