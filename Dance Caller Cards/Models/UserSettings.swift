//
//  UserSettings.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/17/22.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var leftDancer: String = "lark"
    @Published var rightDancer: String = "raven"
    
    // how to format the beats on dance cards
    @Published var beatsNotation: BeatsNotation = BeatsNotation.parens
    enum BeatsNotation: String, CaseIterable {
        case parens = "()"
        case brackets = "[]"
        case curlyBrackets = "{}"
        case slash = " /"
        case none = " "
    }
    
    // display A1, A2, B1, B2 on dance cards
    @Published var showPartNames: Bool = true
    
    init() {}
}
