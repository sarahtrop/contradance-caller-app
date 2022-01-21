//
//  EventList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct EventList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // retrieving data from the environment
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Program.date, ascending: true)]) var events: FetchedResults<Event>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                Toolbar(eventView: true)
            }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
    }
}
