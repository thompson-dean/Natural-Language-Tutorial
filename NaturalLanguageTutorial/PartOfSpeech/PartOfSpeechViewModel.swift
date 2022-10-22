//
//  PartOfSpeechViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI
import NaturalLanguage

enum FilterWords {
    case all
    case verbs
    case nouns
}

class PartOfSpeechViewModel: ObservableObject {
    @Published var taggedWords: [TaggedWord] = []
    @Published var taggedVerbs: [TaggedWord] = []
    @Published var taggedNouns: [TaggedWord] = []
    
    let englishText = "Eric Allan Dolphy Jr. was an American jazz alto saxophonist, bass clarinetist and flautist. On a few occasions, he also played the clarinet and piccolo."
    let japaneseText = "エリック・ドルフィーは、アメリカ合衆国のジャズ・ミュージシャン。マルチ・リード奏者として、卓越した技巧と特異なアドリブ・フレーズを持ち、それまで主にクラシック音楽界で使用されていたバス・クラリネットをジャズの独奏楽器として用い、後のジャズ奏者に多大な影響を与えた。"
    
    func tagText(text: String, filter: FilterWords) -> [TaggedWord] {
        taggedWords = []
        //　NLTaggerインスタンスを作成（.lexicalClassのスキームで）
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        //　テキストを設定
        tagger.string = text
        // 句読点・スペースを除外するオプションを作成
        let options: NLTagger.Options = [.omitWhitespace, .omitPunctuation]
        //enumeratetags(in:unit:scheme:)メソッドを使用して単語を列挙する
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            if let tag {
                let tagForm = tag.rawValue
                switch filter {
                case .all:
                    let taggedWord = TaggedWord(word: String(text[tokenRange]), tag: tagForm)
                    taggedWords.append(taggedWord)
                case .verbs:
                    if tagForm == "Verb" {
                        let taggedWord = TaggedWord(word: String(text[tokenRange]), tag: tagForm)
                        taggedWords.append(taggedWord)
                    }
                case .nouns:
                    if tagForm == "Noun" {
                        let taggedWord = TaggedWord(word: String(text[tokenRange]), tag: tagForm)
                        taggedWords.append(taggedWord)
                    }
                }
            }
            return true
        }
        return taggedWords
    }
}
