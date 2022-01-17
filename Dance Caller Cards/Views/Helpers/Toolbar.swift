//
//  Toolbar.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    var currentView: String

    private var dancesColor: String { return currentView == "dances" ? "AccentColor" : "black" }
    private var programsColor: String { return currentView == "programs" ? "AccentColor" : "black" }
    private var eventsColor: String { return currentView == "events" ? "AccentColor" : "black" }
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "music.note.list")
                    Text("Dances")
                }
                .padding(.horizontal, 5)
                .foregroundColor(Color(dancesColor))
                Divider()
                VStack {
                    Image(systemName: "music.mic")
                    Text("Programs")
                }
                .padding(.horizontal, 5)
                .foregroundColor(Color(programsColor))
                Divider()
                VStack {
                    Image(systemName: "music.note.house")
                    Text("Events")
                }
                .padding(.horizontal, 5)
                .foregroundColor(Color(eventsColor))
                Spacer()
            }
        }
    }
}
