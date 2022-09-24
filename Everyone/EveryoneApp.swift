//
//  EveryoneApp.swift
//  Everyone
//
//  Created by Paul Molczanski on 2022-09-19.
//

import SwiftUI

@main
struct EveryoneApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
