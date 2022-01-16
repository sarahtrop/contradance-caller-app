//
//  ModelData.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    var choreographers: [Choreographer] = load("choreographers.json")
    var tags: [Tag] = load("tags.json")
    var dances: [Dance] = load("dances.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
