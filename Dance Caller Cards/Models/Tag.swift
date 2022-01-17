//
//  Tag.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

struct Tag: Hashable, Codable {
    var name: String
    var color : String = "white"

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case formation = "formation"
        case progression = "progression"
        case figure = "figure"
    }
}

extension Tag: Identifiable, Comparable {
    var id : UUID { return UUID() }
    
    init(name: String, category: String) {
        self.name = name
        self.category = Category(rawValue: category)!

        self.color = self.category == Category.formation ? "FormationTagColor" : self.color
        self.color = self.category == Category.progression ? "ProgressionTagColor" : self.color
    }

    static func <(lhs: Tag, rhs: Tag) -> Bool {
        lhs.name < rhs.name
    }

}
