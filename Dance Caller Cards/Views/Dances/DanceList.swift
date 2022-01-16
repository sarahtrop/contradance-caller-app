//
//  DanceList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/7/22.
//

import SwiftUI

struct DanceList: View {
    var dances: [Dance]
    var title: String
    
    @State private var selection: Set<Dance> = []
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
                List {
                    ForEach(filteredDances) { dance in
                        DanceCard(dance: dance, isExpanded: self.selection.contains(dance))
                            .onTapGesture {
                                self.selectDeselect(dance)
                            }
                            .transition(AnyTransition.move(edge: .top))
                            .animation(.linear, value: 0.3)
                    }
                }
                .listStyle(.plain)
            }
            .searchable(text: $textSearch, placement: .navigationBarDrawer(displayMode: .always))
            .popover(isPresented: $showFilterPopup) {
                FilterPopupView(filterSelection: $filterSelection)
            }
            .navigationBarTitle(title)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: NewDanceForm()) {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .foregroundColor(Color.green)
                            .padding(.trailing, 10)
                            .frame(width: 40, height: 30)
                            .shadow(color: .gray, radius: 0.5)
                    },
                trailing:
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .foregroundColor(Color("AccentColor"))
                        .padding(.trailing, 10)
                        .frame(width: 40, height: 25)
                        .shadow(color: .gray, radius: 0.5)
                        .onTapGesture { showFilterPopup = true })
        }
    }
    
    private func selectDeselect(_ dance: Dance) {
        if selection.contains(dance) {
            selection.remove(dance)
        } else {
            selection.insert(dance)
        }
    }
}

struct DanceList_Previews: PreviewProvider {
    static var previews: some View {
        DanceList(dances: ModelData().dances,
                  title: "All Dances")
    }
}
