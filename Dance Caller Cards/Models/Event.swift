//
//  Event.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import Foundation
import SwiftUI

class Event: Identifiable, ObservableObject {
    var name: String = ""
    var programs: [Int: Program]
    var notes: String = ""
    var date: Date? = nil
    var id : UUID { return UUID() }
    
    init(name: String, programs: [Int: Program], date: Date?, notes: String?) {
        self.name = name
        self.notes = notes ?? ""
        self.programs = programs
        self.date = date ?? nil
    }

    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }
}
