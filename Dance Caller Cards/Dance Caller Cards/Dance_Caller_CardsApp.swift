//
//  Dance_Caller_CardsApp.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/2/22.
//

import SwiftUI

@main
struct Dance_Caller_CardsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
