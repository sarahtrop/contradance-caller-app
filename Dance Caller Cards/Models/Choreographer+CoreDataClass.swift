//
//  Choreographer+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/19/22.
//
//

import Foundation
import CoreData

@objc(Choreographer)
public class Choreographer: NSManagedObject, Codable {
    // ENCODING / DECODING
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
            throw DecoderConfigurationError.missingManagedObjectContext
        }
        self.init(context: context)

        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
