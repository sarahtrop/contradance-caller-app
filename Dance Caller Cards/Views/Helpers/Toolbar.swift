//
//  Toolbar.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    @State var danceView: Bool = false
    @State var programView: Bool = false
    @State var eventView: Bool = false

    private var dancesColor: Color { return danceView ? Color("AccentColor") : Color.black }
    private var programsColor: Color { return programView ? Color("AccentColor") : Color.black }
    private var eventsColor: Color { return eventView ? Color("AccentColor") : Color.black }
    
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .bottomBar) {
            HStack {
                Spacer()
                NavigationLink(destination: DanceList(), isActive: $danceView) {
                   VStack {
                        Image(systemName: "music.note.list")
                        Text("Dances")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal, 5)
                .foregroundColor(dancesColor)
                Divider()
                NavigationLink(destination: ProgramList(), isActive: $programView) {
                    VStack {
                        Image(systemName: "music.mic")
                        Text("Programs")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal, 5)
                .foregroundColor(programsColor)
                Divider()
                NavigationLink(destination: EventList(), isActive: $eventView) {
                    VStack {
                        Image(systemName: "music.note.house")
                        Text("Events")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .padding(.horizontal, 5)
                .foregroundColor(eventsColor)
                Spacer()
            }
        }
    }
}
