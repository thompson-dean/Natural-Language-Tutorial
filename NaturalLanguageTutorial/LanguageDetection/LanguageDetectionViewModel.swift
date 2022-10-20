//
//  LanguageDetectionViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI


import NaturalLanguage

class LanguageDetectionViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var chosenLanguage = ""
    
    let randomLanguageArray: [String] = [
    "Hej! mit navn er Dean! Hvem er du?",
    "Kamusta! ang pangalan ko ay Dean! Sino ka?",
    "Hola! em dic Dean! Qui ets?",
    "Γειά σου! με λένε Ντιν! Ποιος είσαι?",
    "helo! nama saya Dean! siapa awak",
    "ウィッス。俺ディーンだぞ！お前は誰？",
    "Здраво! моје име је Деан! Ко си ти?",
    "Hallå! jag heter Dean! Vem är du?",
    "Witam! nazywam się Dean! Kim jesteś?"
    ]
    
    func recognizeLanguage(text: String) {
        //　NLLanguageRecognizerのインスタンスを作成する
        let recognizer = NLLanguageRecognizer()
        //　分析したいテキストを設定する
        recognizer.processString(text)
        
        //　オプショナルチェック
        if let language = recognizer.dominantLanguage {
            // 言語名をprintする
            guard let detectedLanguage = Locale.current.localizedString(forIdentifier: language.rawValue) else { return }
            chosenLanguage = detectedLanguage
        } else {
            print("DEBUG: ERROR")
        }
    }
    
    func hypothesizeLanguage() {
        let string = """
        Hello world, I love machine learning and I work as a Data Scientist in India. 機械学習で働くのが好き。
        """
        //　NLLanguageRecognizerのインスタンスを作成する
        let recognizer = NLLanguageRecognizer()

        // 分析したいテキストを設定する
        recognizer.processString(string)
        
        // 言語に仮説をprintする
        print("Possible languages are:\(recognizer.languageHypotheses(withMaximum: 2))")
    }
}


