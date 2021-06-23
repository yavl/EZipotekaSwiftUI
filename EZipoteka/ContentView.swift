//
//  ContentView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import SwiftUI
import AppTrackingTransparency

struct ContentView: View {
    @State var credits = [
        Credit(name: "ЖК Чистое небо - Студия", bank: "Банк Санкт-Петербург", sum: 2800000, interest: 5.85, term: 20),
        Credit(name: "ЖК Солнечный город - Студия", bank: "СберБанк", sum: 12800000, interest: 5.85, term: 20)
    ]
    
    var body: some View {
        TabView() {
            ListView(credits: $credits)
                .tabItem {
                    Image(systemName: "rectangle.grid.1x2")
                    Text("Список")
                }
            AddView(credits: $credits)
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
