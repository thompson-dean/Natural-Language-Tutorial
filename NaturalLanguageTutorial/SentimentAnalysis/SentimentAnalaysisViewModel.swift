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
    case superSad = "ð¤"
    case sad = "ð­"
    case unhappy = "ð¢"
    case OK = "ð"
    case happy = "ð"
    case awesome = "ð¤©"
}

class SentimentAnalaysisViewModel: ObservableObject {
    @Published var text: String = "ææåæã ã"
    @Published var text2: String = "ææåæã ã"
    private var sentimentScore: Double = 0
    
    func getSentiment(text: String) -> Emotion {
        //ãNLTaggerã¤ã³ã¹ã¿ã³ã¹ãä½æï¼.sentimentScoreã®ã¹ã­ã¼ã ã§ï¼
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        //ããã­ã¹ããè¨­å®ãã
        tagger.string = text
        //ã.tag(at:unit:scheme:)ã¡ã½ããä½¿ç¨ãã¦ãææscoreãåãåºãã
        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0
        //ãOptionalã®è§£æ¶
        if let sentiment {
            sentimentScore = Double(sentiment.rawValue) ?? 0
        }
        
        // ãææscoreã«ãã£ã¦ãåºåãå¤ãã
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
