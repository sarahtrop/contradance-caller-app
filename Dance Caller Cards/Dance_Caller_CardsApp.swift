//
//  Dance_Caller_CardsApp.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

@main
struct Dance_Caller_CardsApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.persistentContainer.viewContext)
        }
    }
}
