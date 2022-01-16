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
    var color : [Double] = [0.0, 0.0, 0.0, 0.0]

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
        
        let formationTagColor = [0.573, 0.486, 0.929, 0.5]
        let progressionTagColor = [0.335, 0.444, 0.848, 0.5]

        if self.category == Category.formation {
            self.color = formationTagColor
        } else if self.category == Category.progression {
            self.color = progressionTagColor
        }
    }

    static func <(lhs: Tag, rhs: Tag) -> Bool {
        lhs.name < rhs.name
    }

}
