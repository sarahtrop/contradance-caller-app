//
//  FilterPopupView.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import SwiftUI

struct CheckView: View {
    var text: String
    var isChecked: Bool = false

    var body: some View {
        HStack {
            Image(systemName: isChecked ? "circle.fill" : "circle")
            Text(text)
        }
    }
}

struct FilterPopupView: View {
    @Binding var filterSelection: Set<String>
    @Environment(\.presentationMode) var presentationMode
    
    var tagCategories: [String] {
        return Array(Set(ModelData().tags.map({ $0.category.rawValue }))).sorted().reversed()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("by tag")) {
                        ForEach(tagCategories, id:\.self) { category in
                            Section(header: Text("\(category)s")) {
                                ForEach(ModelData().tags.filter({$0.category.rawValue == category})) { tag in
                                    CheckView(text: tag.name, isChecked: filterSelection.contains(tag.name))
                                        .onTapGesture {
                                            self.checkUncheck(tag.name)
                                        }
                                }
                            }
                        }
                    }
                    Section(header: Text("by choreographer")) {
                        ForEach(ModelData().choreographers, id:\.self) { choreographer in
                            CheckView(text: choreographer.name, isChecked: filterSelection.contains(choreographer.name))
                                .onTapGesture {
                                    self.checkUncheck(choreographer.name)
                                }
                        }
                    }
                }
                Text("\(filterSelection.count) filters selected")
            }
            .navigationTitle("Filter dances")
            .navigationBarItems(trailing:
                Image(systemName: "xmark.circle")
                    .resizable()
                    .foregroundColor(Color.red)
                    .padding(.all, 10)
                    .frame(width: 50, height: 50)
                    .shadow(color: .gray, radius: 0.5)
                                    .onTapGesture {
                    presentationMode.wrappedValue.dismiss()}
            )
        }
    }
    
    func checkUncheck(_ item: String) {
        if filterSelection.contains(item) {
            filterSelection.remove(item)
        } else {
            filterSelection.insert(item)
        }
    }
}
