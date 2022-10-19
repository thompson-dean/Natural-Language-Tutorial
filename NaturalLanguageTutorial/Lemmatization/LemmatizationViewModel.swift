//
//  LemmatizationViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI
import NaturalLanguage

class LemmatizationViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var lemmas: [Lemma] = []
    
    let englishText = "learned, learning, learns, learnt, sings, sang, sung, sings"
    let japaneseText = "食べた、食べなかった、食べたら、食べない、食べる"

    func lemmatizeText(text: String) {
        let tagger = NLTagger(tagSchemes: [.lemma])
        tagger.string = text

        lemmas = []
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lemma) { tag, tokenRange in
            if let tag {
                let stemForm = tag.rawValue
                let lemma = Lemma(tag: stemForm, token: String(text[tokenRange]))
                lemmas.append(lemma)
                print("\(lemma.tag): \(lemma.token)")
            }
            return true
        }
    }
}
