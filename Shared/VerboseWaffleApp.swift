//
//  VerboseWaffleApp.swift
//  Shared
//
//  Created by Hunter Bowman on 10/30/21.
//

import SwiftUI

@main
struct VerboseWaffleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
