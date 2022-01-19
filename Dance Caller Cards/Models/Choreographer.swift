//
//  Choreographer.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import SwiftUI

class Choreographer: Hashable, Codable, Equatable, Identifiable, Comparable, ObservableObject {
    var name: String
    var id : UUID { return UUID() }
    
    init(name: String) {
        self.name = name
    }
    
    static func <(lhs: Choreographer, rhs: Choreographer) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func == (lhs: Choreographer, rhs: Choreographer) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
