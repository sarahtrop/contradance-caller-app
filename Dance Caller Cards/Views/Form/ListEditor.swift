//
//  ListEditor.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import SwiftUI

struct ListEditor: View {
    
    var title: String
    var placeholderText: String
    var addText: String
    @Binding var list: [String]
    var suggestions: [String] = []
    
    func getBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { list[index] },
                               set: { list[index] = $0 })
    }
    
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(0..<list.count, id: \.self) { index in
                ListItem(placeholder: placeholderText, text: getBinding(forIndex: index), suggestions: suggestions) { self.list.remove(at: index) }
            }
            AddListItemButton(text: addText) { self.list.append("") }
        }
    }
}

fileprivate struct ListItem: View {
    
    var placeholder: String
    var text: Binding<String>
    var removeAction: () -> Void
    
    @ObservedObject private var autocomplete = AutocompleteObject()
    
    @State var input: String = ""
    
    init(placeholder: String, text: Binding<String>, suggestions: [String], removeAction: @escaping () -> Void) {
        self.placeholder = placeholder
        self.text = text
        self.removeAction = removeAction
        autocomplete.setSuggestions(allSuggestions: suggestions)
    }
    
    var body: some View {
        HStack {
            Button(action: removeAction) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
                    .padding(.horizontal, 2)
            }
            VStack {
                TextField(placeholder, text: $input)
                    .disableAutocorrection(true)
                    .onChange(of: input) { newValue in
                        autocomplete.autocomplete(input)
                    }
            }
            List(autocomplete.suggestions, id: \.self) { suggestion in
                ZStack {
                    Text(suggestion)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .onTapGesture {
                    input = suggestion
                }
            }
        }
    }
    
}

struct AddListItemButton: View {
    
    var text: String
    var addAction: () -> Void
    
    var body: some View {
        Button(action: addAction) {
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .padding(.horizontal, 2)
                Text(text)
            }
        }
    }
}
