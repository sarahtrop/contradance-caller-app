//
//  Tag.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

class Tag: Hashable, Codable, Equatable, Comparable, Identifiable, ObservableObject {
    var name: String
    var color : Color = Color.white
    var id : UUID { return UUID() }

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case formation = "formation"
        case progression = "progression"
        case figure = "figure"
    }
    
    required init(name: String, category: String) {
        self.name = name
        self.category = Category(rawValue: category)!
        if category == "formation" {
            self.color = Color("FormationTagColor")
        } else if category == "progression" {
            self.color = Color("ProgressionTagColor")
        }
    }
    
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    static func <(lhs: Tag, rhs: Tag) -> Bool {
        return lhs.name < rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(category)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case category
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        category = try values.decode(Tag.Category.self, forKey: .category)
        color = Color.white
        if category.rawValue == "formation" {
            color = Color("FormationTagColor")
        } else if category.rawValue == "progression" {
            color = Color("ProgressionTagColor")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
    }
}
