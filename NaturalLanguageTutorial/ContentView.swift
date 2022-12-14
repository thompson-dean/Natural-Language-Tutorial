//
//  ContentView.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Introduction()
                } label: {
                    Text("Introduction")
                }
                NavigationLink {
                    Tokenization()
                } label: {
                    Text("Tokenization")
                }
                NavigationLink {
                    Lemmatization()
                } label: {
                    Text("Lemmatization")
                }
                NavigationLink {
                    PartOfSpeech()
                } label: {
                    Text("Part-Of-Speech Tagging")
                }
                NavigationLink {
                    LanguageDetection()
                } label: {
                    Text("Language Detection")
                }
                NavigationLink {
                    SentimentAnalysis()
                } label: {
                    Text("Sentiment Analysis")
                }
                NavigationLink {
                    WordEmbeddings()
                } label: {
                    Text("Word Embeddings")
                }
            }
            .navigationTitle("目次")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
