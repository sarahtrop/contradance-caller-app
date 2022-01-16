//
//  Dance.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

struct Dance: Hashable, Codable {
    var name: String = ""
    var notes: String = ""
    var choreographer: Choreographer = Choreographer(name: "Chestnut") // default
    var figures: [String: [Figure]] = ["A1": [], "A2": [], "B1": [], "B2": []]
    
    var tags: [Tag] = []
    
    struct Figure: Hashable, Codable, Identifiable {
        var figure: String
        var beats: Int
        var id: UUID { return UUID() }
    }
    
    func getTagNames(_ category: String?) -> [String] {
        if category != nil {
            return self.tags.filter({ $0.category.rawValue == category }).map({ $0.name })
        } else {
            return self.tags.map({ $0.name })
        }
    }
    
    func hasTag(_ tag: String) -> Bool {
        let allTags = self.getTagNames(nil)
        return allTags.contains(tag)
    }
}

extension Dance: Identifiable {
    var id : UUID { return UUID() }
}
