//
//  Tag.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/3/22.
//

import Foundation

class Tag: ObservableObject {
    @Published var name: String
    @Published var category: String
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}
