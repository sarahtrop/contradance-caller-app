//
//  Program.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import Foundation

class Program: ObservableObject {
    @Published var name: String
    @Published var dances: [Dance]
    
    init(name: String, dances: [Dance]) {
        self.name = name
        self.dances = dances
    }
}
