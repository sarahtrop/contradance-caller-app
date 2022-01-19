//
//  Dance.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

class Dance: Hashable, Equatable, Codable, Identifiable, ObservableObject {
    var name: String = ""
    var choreographer: Choreographer = Choreographer(name: "Chestnut") // default
    var figures: [Figure] = []
    var tags: [Tag] = []
    var id : UUID { return UUID() }
    var notes: String = ""
    
    struct Figure: Hashable, Codable, Identifiable, Comparable {
        var figure: String
        var beats: Int
        var part: String
        var order: Int
        var id: UUID { return UUID() }
        
        static func <(lhs: Figure, rhs: Figure) -> Bool {
            return lhs.order < rhs.order
        }
        
        static func == (lhs: Figure, rhs: Figure) -> Bool {
            return lhs.id == rhs.id
        }
        
        func beatsString(_ beatsNotation: UserSettings.BeatsNotation) -> String {
            let stringNotation = Array(beatsNotation.rawValue)
            return "\(stringNotation[0])\(self.beats)\(stringNotation[1])"
        }
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
    
    static func == (lhs: Dance, rhs: Dance) -> Bool {
        return lhs.name == rhs.name && lhs.choreographer == rhs.choreographer
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(choreographer)
    }
}
