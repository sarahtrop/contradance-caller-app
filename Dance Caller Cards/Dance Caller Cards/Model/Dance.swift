//
//  Dance.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import Foundation
import SwiftUI

class Dance: ObservableObject {
    @Published var name: String
    @Published var author: String
    @Published var notes: String

    @Published var A1: [Figure]
    @Published var A2: [Figure]
    @Published var B1: [Figure]
    @Published var B2: [Figure]
    
    @Published var tags: [Tag]
    
    struct Figure: Hashable, Codable, Identifiable {
        var id: Int
        var figure: String
        var beats: Int
    }
    
    init(name: String, author: String, notes: String,
         A1: [Figure], A2: [Figure], B1: [Figure], B2: [Figure]) {
        self.name = name
        self.author = author
        self.notes = notes
        self.A1 = A1
        self.A2 = A2
        self.B1 = B1
        self.B2 = B2
        self.tags = []
    }
    
    func addTag(name: String, category: String) {
        @StateObject var tagObj = Tag(name: name, category: category)
        self.tags.append(tagObj)
    }
    
    func setNotes(notes: String) {
        self.notes = notes
    }
}
