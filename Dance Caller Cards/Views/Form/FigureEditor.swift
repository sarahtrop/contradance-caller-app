//
//  FigureEditor.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/15/22.
//

import SwiftUI

struct FigureEditor: View {
    var title: String
    var placeholderText: String
    var addText: String
    @Binding var figureList: [String]
    @Binding var beatsList: [Int]
    
    private func getStringBinding(forIndex index: Int) -> Binding<String> {
        return Binding<String>(get: { figureList[index] },
                               set: { figureList[index] = $0 })
    }
    
    private func getIntBinding(forIndex index: Int) -> Binding<Int> {
        return Binding<Int>(get: { beatsList[index] },
                            set: { beatsList[index] = $0 })
    }
    
    private func removeFigure(index: Int) {
        self.figureList.remove(at: index)
        self.beatsList.remove(at: index)
    }
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(0..<figureList.count, id: \.self) { index in
                FigureItem(placeholder: placeholderText, text: getStringBinding(forIndex: index), beats: getIntBinding(forIndex: index)) { removeFigure(index:index) }
            }
            AddListItemButton(text: addText) { self.figureList.append("") }
        }
    }
}

fileprivate struct FigureItem: View {
    
    var placeholder: String
    var text: Binding<String>
    var beats: Binding<Int>
    var removeAction: () -> Void
    
    @State var input: String = ""
    
    init(placeholder: String, text: Binding<String>, beats: Binding<Int>, removeAction: @escaping () -> Void) {
        self.placeholder = placeholder
        self.text = text
        self.beats = beats
        self.removeAction = removeAction
    }
    
    var body: some View {
        HStack {
            Button(action: removeAction) {
                Image(systemName: "minus.circle.fill")
                    .foregroundColor(.red)
                    .padding(.horizontal, 2)
            }
            Picker("", selection: beats) {
                ForEach(1...32, id:\.self) {
                    Text("\($0)")
                }
            }
            Divider()
            TextField(placeholder, text: $input)
                .disableAutocorrection(true)
        }
    }
    
}
