//
//  TextClassificationViewModel.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import Foundation
import SwiftUI
import NaturalLanguage

enum Emotion: String {
    case superSad = "🤕"
    case sad = "😭"
    case unhappy = "😢"
    case OK = "🙂"
    case happy = "😁"
    case awesome = "🤩"
}

class SentimentAnalaysisViewModel: ObservableObject {
    @Published var text: String = "感情分析だぞ"
    @Published var text2: String = "感情分析だぞ"
    private var sentimentScore: Double = 0
    
    func getSentiment(text: String) -> Emotion {
        //　NLTaggerインスタンスを作成（.sentimentScoreのスキームで）
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        //　テキストを設定する
        tagger.string = text
        //　.tag(at:unit:scheme:)メソッド使用して、感情scoreを取り出す。
        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0
        //　Optionalの解消
        if let sentiment {
            sentimentScore = Double(sentiment.rawValue) ?? 0
        }
        
        // 　感情scoreによって、出力が変わる
        if sentimentScore < -0.8 {
            return .superSad
        } else if sentimentScore < -0.4 {
            return  .sad
        } else if sentimentScore < 0 {
            return  .unhappy
        } else if sentimentScore < 0.4 {
            return  .OK
        } else if sentimentScore < 0.8 {
            return  .happy
        } else if sentimentScore <= 1 {
            return  .awesome
        } else {
            return  .OK
        }
    }
    
    
    func getSentimentColor(text: String) -> Color {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0
        
        if let sentiment {
            sentimentScore = Double(sentiment.rawValue) ?? 0
        }
        
        if sentimentScore < -0.8 {
            return .red
        } else if sentimentScore < -0.4 {
            return .red
        } else if sentimentScore < 0 {
            return .orange
        } else if sentimentScore < 0.4 {
            return .primary
        } else if sentimentScore < 0.8 {
            return .blue
        } else if sentimentScore <= 1 {
            return .green
        } else {
            return .primary
        }
    }
}
