//
//  DanceList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/7/22.
//

import SwiftUI

struct DanceList: View {
    var dances: [Dance] = ModelData().dances

    @State private var showFilterPopup: Bool = false
    
    // filtering & search
    @State private var filterSelection = Set<String>()
    @State private var textSearch: String = ""
    
    var filteredDances: [Dance] {
        // make a list of dances which are filtered based on tag, choreographer, or name
        // allow multiple filters
        var filteredDances: [Dance] = dances
        
        // make sure for the text search we are searching tags, choreographer names, and dance names
        if !textSearch.isEmpty {
            filteredDances = filteredDances.filter { $0.name.contains(textSearch) || $0.getTagNames(nil).contains(textSearch) ||
                $0.choreographer.name.contains(textSearch)
            }
        }
        // for the filter ui options, we need to check tags and choreographers
        if !filterSelection.isEmpty {
            for item in filterSelection {
                filteredDances = filteredDances.filter { $0.hasTag(item) || $0.choreographer.name == item}
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
    }
}

struct DanceList_Previews: PreviewProvider {
    static var previews: some View {
        DanceList()
    }
}
