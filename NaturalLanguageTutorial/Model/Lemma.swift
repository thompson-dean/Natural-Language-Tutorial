//
//  Lemma.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/19.
//

import Foundation

struct Lemma: Identifiable {
    let tag: String
    let token: String
}

extension Lemma {
    var id: UUID {
        return UUID()
    }
}
