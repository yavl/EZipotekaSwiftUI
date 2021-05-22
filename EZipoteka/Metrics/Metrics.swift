//
//  Metrics.swift
//  EZipoteka
//
//  Created by Vladislav Nikolaev on 22.05.2021.
//

import Firebase

class Metrics {
    enum Event: String {
        case
        addCredit,
        saveCredit,
        openCredit
    }
    
    static func logEvent(event: Event) {
        Analytics.logEvent(event.rawValue, parameters: [:])
    }
}
