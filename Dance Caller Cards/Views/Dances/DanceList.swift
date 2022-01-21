//
//  DanceList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/7/22.
//

import SwiftUI

struct DanceList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // retrieving data from the environment
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Dance.name, ascending: true)]) var dances: FetchedResults<Dance>
    
    // filtering & search
    @State private var showFilterPopup: Bool = false
    @State private var filterSelection = Set<String>()
    @State private var textSearch: String = ""

    var filteredDances: Array<Dance> {
        // make a list of dances which are filtered based on tag, choreographer, or name
        // allow multiple filters
        var filteredDances: Array<Dance> = Array(dances)
        
        // make sure for the text search we are searching tags, choreographer names, and dance names
        if !textSearch.isEmpty {
            filteredDances = filteredDances.filter { $0.name!.contains(textSearch) || $0.tagNames.contains(textSearch) ||
                $0.choreographerName.contains(textSearch)
            }
        }
        // for the filter ui options, we need to check tags and choreographers
        if !filterSelection.isEmpty {
            for item in filterSelection {
                filteredDances = filteredDances.filter { $0.hasTag(item) || $0.choreographer!.name! == item}
            }
        }
        return filteredDances
    }

    var body: some View {
        NavigationView {
            VStack {
                ExpandableDanceCardList(dances: filteredDances)
                if !filterSelection.isEmpty {
                    Text("Active filters: \(filterSelection.joined(separator: ", "))")
                }
            }
            .searchable(text: $textSearch, placement: .navigationBarDrawer(displayMode: .always))
            .popover(isPresented: $showFilterPopup) {
                TagFilterPopup(filterSelection: $filterSelection)
            }
            .navigationBarTitle(Text("All Dances").font(.subheadline))
            .navigationBarItems(
                leading: NavigationLink(destination: NewDanceForm()) { AddIcon() },
                trailing: FilterIcon().onTapGesture { showFilterPopup = true })
            .toolbar {
                Toolbar(danceView: true)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DanceList_Previews: PreviewProvider {
    static var previews: some View {
        DanceList()
    }
}
