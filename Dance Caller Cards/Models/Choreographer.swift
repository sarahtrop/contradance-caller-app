//
//  Choreographer.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

struct Choreographer: Hashable, Codable {
    var name: String
}

extension Choreographer: Identifiable, Comparable {
    var id : UUID { return UUID() }
    
    static func <(lhs: Choreographer, rhs: Choreographer) -> Bool {
        lhs.name < rhs.name
    }
}
