//
//  TextClassification.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct SentimentAnalysis: View {
    
    @StateObject var viewModel = SentimentAnalaysisViewModel()
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is Sentiment Analysis?")
                        .font(.largeTitle)
                        .bold()
                    Text("感情分析とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("一般的にテキストに含まれる感情を予測する多値分類の文書分類タスクを指すことが多いです")
                        .font(.title2)
                        .padding(.trailing, 380)
                        .padding(.bottom, 8)
                    
                    Button {
                        withAnimation {
                            isShowingExample.toggle()
                        }
                    } label: {
                        HStack(spacing: 0) {
                            Text(isShowingExample ? "例 " : "例 ")
                                .font(.title)
                            Image(systemName: isShowingExample ? "chevron.up" : "chevron.down")
                        }
                        .bold()
                    }
                    
                    if isShowingExample {
                        Image("sentiment_code")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 710, height: 1000)
                    }
                    
                    Button {
                        withAnimation {
                            isShowingReal.toggle()
                        }
                    } label: {
                        HStack(spacing: 0) {
                            Text(isShowingReal ? "実用例 " : "実用例 ")
                                .font(.title)
                            Image(systemName: isShowingReal ? "chevron.up" : "chevron.down")
                        }
                        .bold()
                    }
                    
                    if isShowingReal {
                        TextEditor(text: $viewModel.text)
                            .font(.title2)
                            .padding(4)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.secondary).opacity(0.5))
                                .frame(width: 1000, height: 50)
                        
                        Text(viewModel.getSentiment(text: viewModel.text).rawValue)
                            .font(.system(size: 150))
                        
                        TextEditor(text: $viewModel.text2)
                            .font(.title2)
                            .foregroundColor(viewModel.getSentimentColor(text: viewModel.text2))
                            .padding(4)
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.secondary).opacity(0.5))
                                .frame(width: 1000, height: 50)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Sentiment Analysis")
    }
}

struct TextClassification_Previews: PreviewProvider {
    static var previews: some View {
        SentimentAnalysis()
    }
}
