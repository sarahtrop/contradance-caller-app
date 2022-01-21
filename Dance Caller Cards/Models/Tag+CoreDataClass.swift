//
//  Tag+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/19/22.
//
//

import Foundation
import SwiftUI
import CoreData

@objc(Tag)
public class Tag: NSManagedObject, Codable {
    // EXTRA VARIABLE
    var color: Color = Color.white
    
    // COMPARABLE
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.name == rhs.name && lhs.category == rhs.category
    }
    
    static func <(lhs: Tag, rhs: Tag) -> Bool {
        return lhs.name ?? "" < rhs.name ?? ""
    }
    
    // HELPER FUNCTIONS
    func setColor() -> Void {
        if self.category == "formation" {
            self.color = Color("FormationTagColor")
        } else if self.category == "progression" {
            self.color = Color("ProgressionTagColor")
        }
    }
    
    // CODABLE
    enum CodingKeys: String, CodingKey {
        case name
        case category
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        category = try values.decode(String.self, forKey: .category)
        color = Color.white
        if category == "formation" {
            color = Color("FormationTagColor")
        } else if category == "progression" {
            color = Color("ProgressionTagColor")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
    }
}

extension CodingUserInfoKey {
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}
