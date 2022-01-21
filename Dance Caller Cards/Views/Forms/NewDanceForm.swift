//
//  NewDanceForm.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/15/22.
//

import SwiftUI
import CoreData

struct NewDanceForm: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var name: String = ""
    @State private var notes: String = ""
    @State private var choreographer: String = ""
    @State private var tags: [String] = []
    @State private var figures: [String] = []
    @State private var beats: [Int] = []
    
    // retrieving data from the environment
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Dance.name, ascending: true)]) var existingTags: FetchedResults<Tag>

    var body: some View {
        NavigationView {
            Form(content: {
                Section {
                    TextField("Name", text: $name)
                    TextField("Choreographer", text: $choreographer)
                    TextField("Notes", text: $notes)
                }
                .disableAutocorrection(true)
//                FigureEditor(title: "Figures",
//                             placeholderText: "partner allemande left 1/2",
//                             addText: "Add figure",
//                             figureList: $figures,
//                             beatsList: $beats)
//                }
                ListEditor(title: "Tags",
                           placeholderText: "improper",
                           addText: "Add tag",
                           list: $tags,
                           suggestions: Array(existingTags).map({ $0.name ?? "" }))
            })
            .navigationBarTitle("Add a Dance")
            .onSubmit {
                saveDance()
            }
        }
    }
    
    private func saveDance() {
        let dance = Dance(context: viewContext)
        dance.name = name
        dance.notes = notes
        
        let choreographerObj = Choreographer(context: viewContext)
        choreographerObj.name = choreographer
        dance.choreographer = choreographerObj

        var tagObjects: [Tag] = []
        for tag in tags {
            let tagObj = Tag(context: viewContext)
            tagObj.name = tag
            tagObjects.append(tagObj)
        }
        dance.tags = tagObjects
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct NewDanceForm_Previews: PreviewProvider {
    static var previews: some View {
        NewDanceForm()
    }
}
