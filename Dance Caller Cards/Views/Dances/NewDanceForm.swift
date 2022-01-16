//
//  NewDanceForm.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/15/22.
//

import SwiftUI
import CoreData

struct NewDanceForm: View {
    @State var dance = Dance()
    @State var tags: [String] = []
    @State var a1Figures: [String] = []
    @State var a2Figures: [String] = []
    @State var b1Figures: [String] = []
    @State var b2Figures: [String] = []
    @State var a1Beats: [Int] = []
    @State var a2Beats: [Int] = []
    @State var b1Beats: [Int] = []
    @State var b2Beats: [Int] = []
    @State var choreographer: String = ""

    private var existingTags: [String] = ModelData().tags.map({ $0.name })

    func saveDance() {
        var tagObjects: [Tag] = []
        for tag in tags {
            tagObjects.append(Tag(name: tag, category: ""))
        }
        dance.tags = tagObjects
        dance.choreographer = Choreographer(name: choreographer)
        
    }
    
    var body: some View {
        NavigationView {
            Form(content: {
                Section {
                    TextField("Name", text: $dance.name)
                    TextField("Choreographer", text: $choreographer)
                    TextField("Notes", text: $dance.notes)
                }
                .disableAutocorrection(true)
//                Section {
//                    FigureEditor(title: "A1 Figures",
//                                 placeholderText: "partner allemande left 1/2",
//                                 addText: "Add figure",
//                                 figureList: $a1Figures,
//                                 beatsList: $a1Beats)
//                    FigureEditor(title: "A2 Figures",
//                                 placeholderText: "partner allemande left 1/2",
//                                 addText: "Add figure",
//                                 figureList: $a2Figures,
//                                 beatsList: $a2Beats)
//                    FigureEditor(title: "B1 Figures",
//                                 placeholderText: "partner allemande left 1/2",
//                                 addText: "Add figure",
//                                 figureList: $b1Figures,
//                                 beatsList: $b1Beats)
//                    FigureEditor(title: "B2 Figures",
//                                 placeholderText: "partner allemande left 1/2",
//                                 addText: "Add figure",
//                                 figureList: $b2Figures,
//                                 beatsList: $b2Beats)
//                }
                ListEditor(title: "Tags",
                           placeholderText: "improper",
                           addText: "Add tag",
                           list: $tags,
                           suggestions: existingTags)
            })
            .navigationBarTitle("Add a Dance")
            .onSubmit {
                saveDance()
            }
        }
    }
}

struct NewDanceForm_Previews: PreviewProvider {
    static var previews: some View {
        NewDanceForm()
    }
}
