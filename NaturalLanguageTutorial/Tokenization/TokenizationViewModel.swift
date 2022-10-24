//
//  TokenizationViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI
import NaturalLanguage

class TokenizationViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var tokens: [Token] = []
    
    let apiCaller: APICaller
    
    let englishText = "The goal of the Swift project is to create the best available language for uses ranging from systems programming, to mobile and desktop apps, scaling up to cloud services. Most importantly, Swift is designed to make writing and maintaining correct programs easier for the developer 🐹. To achieve this goal, we believe that the most obvious way to write Swift code must also be:"
    let japaneseText = "以下の表は用語に関する英和対応表です。これを参考にしながら、できるだけ日本語の列と合うよう表記揺れを抑えます。一般的に邦訳があるもの、Apple がドキュメント内で邦訳で言及したものについてはそれを採用し、適した訳が見つからない場合は英語のまま表記します。随時更新。"
    
    init(apiCaller: APICaller = .shared) {
        self.apiCaller = apiCaller
    }
    
    func tokenizeSentence(text: String, unit: NLTokenUnit = .word) {
        tokens = []
        let tokenizer = NLTokenizer(unit: unit)
        tokenizer.string = text

        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            let token = Token(string: String(text[tokenRange].lowercased()))
            tokens.append(token)
            return true
        }
    }
}




