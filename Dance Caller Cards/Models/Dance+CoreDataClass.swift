//
//  Dance+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/19/22.
//
//

import Foundation
import CoreData

@objc(Dance)
public class Dance: NSManagedObject, Codable {
    var tags: [Tag] = []
    var figures: [Figure] = []
    var choreographer: Choreographer?

    var tagNames: [String] {
        getTagNames("")
    }
    var choreographerName: String {
        self.choreographer!.name!
    }
    
    // HELPER FUNCTIONS
    func getTagNames(_ category: String?) -> [String] {
        if category != nil {
            return self.tags.filter({ $0.category == category }).map({ $0.name ?? ""})
        } else {
            return self.tags.map({ $0.name ?? ""})
        }
    }

    func hasTag(_ tag: String) -> Bool {
        let allTags = self.getTagNames(nil)
        return allTags.contains(tag)
    }

    // COMPARISONS
    static func == (lhs: Dance, rhs: Dance) -> Bool {
        return lhs.name == rhs.name && lhs.choreographer == rhs.choreographer
    }
    
    // ENCODING / DECODING
    enum CodingKeys: String, CodingKey {
        case name
        case notes
        case choreographer
        case figures
        case tags
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        notes = try values.decode(String.self, forKey: .notes)
        choreographer = try values.decode(Choreographer.self, forKey: .choreographer)
        figures = try values.decode([Figure].self, forKey: .figures)
        tags = try values.decode([Tag].self, forKey: .tags)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(notes, forKey: .notes)
        try container.encode(choreographer, forKey: .choreographer)
        try container.encode(figures, forKey: .figures)
        try container.encode(tags, forKey: .tags)
    }
}
