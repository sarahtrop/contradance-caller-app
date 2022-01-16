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

extension Choreographer: Identifiable {
    var id : UUID { return UUID() }
}
