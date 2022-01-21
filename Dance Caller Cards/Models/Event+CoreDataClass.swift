//
//  Event+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/20/22.
//
//

import Foundation
import CoreData

@objc(Event)
public class Event: NSManagedObject {
    var programs: [Program] = []
}
