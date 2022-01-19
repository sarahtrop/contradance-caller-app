//
//  Autocomplete.swift
//  Dance Caller Cards
//
//  Created by Sarah Trop on 1/5/22.
//

import Foundation

@MainActor
final class AutocompleteObject: ObservableObject {
    
    let delay: TimeInterval = 0.3
    var allSuggestions: [String] = []

    @Published var suggestions: [String] = []

    init() {
        self.allSuggestions = []
    }
    
    func setSuggestions(allSuggestions: [String]) {
        self.allSuggestions = allSuggestions
    }

    private var task: Task<Void, Never>?
    
    func lookup(list: [String], prefix: String) -> [String] {
        let lowercasedPrefix = prefix.lowercased()
        return list.filter(){ $0.lowercased().hasPrefix(lowercasedPrefix) }
    }

    func autocomplete(_ text: String) {
        guard !text.isEmpty else {
            suggestions = []
            task?.cancel()
            return
        }

        task?.cancel()

        task = Task {
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000.0))

            guard !Task.isCancelled else {
                return
            }

            let newSuggestions: [String] = lookup(list: allSuggestions, prefix: text)

            if isSuggestion(in: suggestions, equalTo: text) {
                // Do not offer only one suggestion same as the input
                suggestions = []
            } else {
                suggestions = newSuggestions
            }
        }
    }

    private func isSuggestion(in suggestions: [String], equalTo text: String) -> Bool {
        guard let suggestion = suggestions.first, suggestions.count == 1 else {
            return false
        }

        return suggestion.lowercased() == text.lowercased()
    }
}
