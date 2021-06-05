//
//  CryptoPriceAlertsApp.swift
//  CryptoPriceAlerts
//
//  Created by Paul Carroll on 6/5/21.
//

import SwiftUI

@main
struct CryptoPriceAlertsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
