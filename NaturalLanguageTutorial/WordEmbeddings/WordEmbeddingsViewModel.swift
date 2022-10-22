//
//  WordEmbeddingsViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI
import NaturalLanguage

class WordEmbeddingsViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var possibleSearchWords: [String] = []
    
    func retrieveNeighbours(text: String) {
        possibleSearchWords = []
        guard let embedding = NLEmbedding.wordEmbedding(for: .english) else { return }
        let similarWords = embedding.neighbors(for: text, maximumCount: 10)
        for word in similarWords {
            possibleSearchWords.append(word.0)
        }
    }
}
