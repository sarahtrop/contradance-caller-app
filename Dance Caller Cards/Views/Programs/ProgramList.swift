//
//  ProgramList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct ProgramList: View {
    var programs: [Program] = ModelData().programs

    @State private var showFilterPopup: Bool = false
    @State private var textSearch: String = ""
    
    var filteredPrograms: [Program] {
        // make a list of dances which are filtered based on tag, choreographer, or name
        // allow multiple filters
        var filteredPrograms: [Program] = programs
        
        // make sure for the text search we are searching tags, choreographer names, and dance names
        if !textSearch.isEmpty {
            filteredPrograms = filteredPrograms.filter { $0.name.contains(textSearch) || $0.getDanceNames().contains(textSearch) ||
                $0.notes.contains(textSearch)
            }
        }
        return filteredPrograms
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPrograms) { program in
                    NavigationLink(destination: ProgramView(program: program)) {
                        HStack {
                            Text(program.name)
                                .font(.headline)
                            Spacer()
                            Text(program.getDateString())
                                .font(.subheadline)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .searchable(text: $textSearch, placement: .navigationBarDrawer(displayMode: .always))
            .navigationBarTitle("Programs")
//            .navigationBarItems(
//                leading: NavigationLink(destination: NewProgramForm()) { AddIcon() })
            .toolbar {
                Toolbar(programView: true)
            }
        }
    }
}

struct ProgramList_Previews: PreviewProvider {
    static var previews: some View {
        ProgramList()
    }
}
