//
//  ProgramList.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct ProgramList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // retrieving data from the environment
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Program.date, ascending: true)]) var programs: FetchedResults<Program>

    @State private var showFilterPopup: Bool = false
    @State private var textSearch: String = ""
    
    var filteredPrograms: Array<Program> {
        // make a list of dances which are filtered based on tag, choreographer, or name
        // allow multiple filters
        var filteredPrograms: Array<Program> = Array(programs)
        
        // make sure for the text search we are searching tags, choreographer names, and dance names
        if !textSearch.isEmpty {
            filteredPrograms = filteredPrograms.filter { $0.name!.contains(textSearch) || $0.danceNames.contains(textSearch) ||
                $0.notes!.contains(textSearch)
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
                            Text(program.name!)
                                .font(.headline)
                            Spacer()
                            Text(program.dateString)
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
