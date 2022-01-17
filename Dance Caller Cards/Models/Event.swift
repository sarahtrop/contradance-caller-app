//
//  Event.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import Foundation
import SwiftUI

struct Event: Hashable, Codable {
    var name: String = ""
    var notes: String = ""
    var programs: [Int: Program]
    var date: Date? = nil
}

extension Event: Identifiable {
    var id : UUID { return UUID() }
}
