//
//  LanguageDetection.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct LanguageDetection: View {
    
    @StateObject var viewModel = LanguageDetectionViewModel()
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    @State private var randomSentence: String = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is Language Recognition?")
                        .font(.largeTitle)
                        .bold()
                    Text("言語認識とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("これは一番わかりやすいかもしれないです。ただ、Stringを分析して、どの言語か出力する。")
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
                        Image("recognition_code")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1200, height: 540)
                        
                        Image("recognition_code_2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1200, height: 400)
                        
                        Image("recognition_code_3")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1200, height: 86)
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
                        Text(randomSentence)
                            .font(.title2)
                            .padding(8)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .frame(width: 1200, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        HStack(spacing: 16) {
                            Button(action: {
                                randomSentence = viewModel.randomLanguageArray[Int.random(in: 0..<viewModel.randomLanguageArray.count)]
                            }) {
                                Text("ランダムな言語を表示")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.blue)
                            .cornerRadius(16)
                            Button(action: {
                                viewModel.recognizeLanguage(text: randomSentence)
                                viewModel.hypothesizeLanguage()
                            }) {
                                Text("言語を分析")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.green)
                            .cornerRadius(16)
                        }
                        .padding(.bottom, 8)
                        
                        if !viewModel.chosenLanguage.isEmpty {
                            Text(viewModel.chosenLanguage)
                                .font(.system(size: 150))
                                .bold()
                                .padding(16)
                                .background(Color.blue)
                                .cornerRadius(16)
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Language Recognition")
    }
}

struct LanguageDetection_Previews: PreviewProvider {
    static var previews: some View {
        LanguageDetection()
    }
}
