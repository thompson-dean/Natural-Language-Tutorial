//
//  TaggedWord.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/20.
//

import Foundation

struct TaggedWord: Identifiable {
    let word: String
    let tag: String
}

extension TaggedWord {
    var id: UUID {
        return UUID()
    }
}
