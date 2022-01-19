//
//  Program.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import Foundation
import SwiftUI

class Program: Identifiable, ObservableObject {
    var name: String
    var dances: [Int: Dance]

    var date: Date? = nil
    var notes: String = ""
    var id : UUID { return UUID() }
    
    init(name: String, dances: [Int: Dance], date: Date?, notes: String?) {
        self.name = name
        self.dances = dances
        self.date = date ?? nil
        self.notes = notes ?? ""
    }
    
    func getDanceNames() -> [String]{
        var danceNames: [String] = []
        for (_, dance) in self.dances {
            danceNames.append(dance.name)
        }
        return danceNames
    }
    
    func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d YY"
        if self.date != nil {
            return formatter.string(from: self.date!)
        }
        return ""
    }
    
    func getDancesInOrder() -> [Dance] {
        var orderedDances: [Dance] = []
        let numDances = self.dances.keys.count
        for idx in (0...numDances) {
            orderedDances.append(self.dances[idx]!)
        }
        return orderedDances
    }
    
    static func == (lhs: Program, rhs: Program) -> Bool {
        return lhs.id == rhs.id
    }
}
