//
//  InfoView.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 14.06.2021.
//

import SwiftUI

struct InfoView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            let text =
                Text("infoView.description") + Text("\n\n") +
                Text("addView.credit.name").bold() + Text(" - ") + Text("infoView.name") + Text("\n\n") +
                Text("addView.credit.bank").bold() + Text(" - ") + Text("infoView.bank") + Text("\n\n") +
                Text("addView.credit.sum").bold() + Text(" - ") + Text("infoView.sum") + Text("\n\n") +
                Text("addView.credit.interest").bold() + Text(" - ") + Text("infoView.interest")
            text
            .padding(10)
            .navigationBarTitle(Text("infoView.title"), displayMode: .inline)
            .toolbar(content: {
                let bundle = Bundle.init(for: UIButton.self)
                let doneTitle = bundle.localizedString(forKey: "Done", value: nil, table: nil)
                Button(doneTitle) {
                    isPresented = false
                }
            })
        }
    }
}
