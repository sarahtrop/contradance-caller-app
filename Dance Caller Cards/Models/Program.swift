//
//  Program.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/16/22.
//

import Foundation
import SwiftUI

struct Program: Hashable, Codable {
    var name: String = ""
    var notes: String = ""
    var dances: [Int: Dance]
    var date: Date? = nil
}

extension Program: Identifiable {
    var id : UUID { return UUID() }
}
