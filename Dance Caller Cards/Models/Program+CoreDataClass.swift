//
//  Program+CoreDataClass.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/20/22.
//
//

import Foundation
import CoreData

@objc(Program)
public class Program: NSManagedObject {
    var dances: [Dance] = []
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: self.date!)
    }
    var danceNames: [String] {
        return self.dances.map({ $0.name ?? "" })
    }
}
