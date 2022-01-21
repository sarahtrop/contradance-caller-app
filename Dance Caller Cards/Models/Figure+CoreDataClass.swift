//
//  Figure+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/19/22.
//
//

import Foundation
import CoreData

@objc(Figure)
public class Figure: NSManagedObject, Codable, Comparable {
    // HELPER FUNCTIONS
    func beatsString(_ beatsNotation: UserSettings.BeatsNotation) -> String {
        let stringNotation = Array(beatsNotation.rawValue)
        return "\(stringNotation[0])\(self.beats)\(stringNotation[1])"
    }
    
    // COMPARABLE
    static public func <(lhs: Figure, rhs: Figure) -> Bool {
        return lhs.order < rhs.order
    }
    
    static public func == (lhs: Figure, rhs: Figure) -> Bool {
        return lhs.id == rhs.id
    }
    
    // ENCODING / DECODING
    enum CodingKeys: String, CodingKey {
        case figure
        case beats
        case part
        case order
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        figure = try values.decode(String.self, forKey: .figure)
        beats = try values.decode(Int16.self, forKey: .beats)
        part = try values.decode(String.self, forKey: .part)
        order = try values.decode(Int16.self, forKey: .order)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(figure, forKey: .figure)
        try container.encode(beats, forKey: .beats)
        try container.encode(part, forKey: .part)
        try container.encode(order, forKey: .order)
    }
}
