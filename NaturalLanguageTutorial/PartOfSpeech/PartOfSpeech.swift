//
//  PartOfSpeech.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI



struct PartOfSpeech: View {
    
    @StateObject var viewModel = PartOfSpeechViewModel()
    @State var isEnglish: Bool = true
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    @State private var filter: FilterWords = .all
    @State private var words: [TaggedWord] = []
    
    let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is Parts-Of-Speech Tagging??")
                        .font(.largeTitle)
                        .bold()
                    Text("品詞タグ付けとは？")
                        .font(.largeTitle)
                        .bold()
                    Text("品詞タグ付けとは、文章中の単語に対して品詞を振ることを指し、系列(単語列)に対してラベルを振っていく“系列ラベリング”の一つです。")
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
                        Image("pos_code")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1200, height: 400)
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
                        Text(isEnglish ? viewModel.englishText : viewModel.japaneseText)
                            .padding(8)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .frame(width: 1200, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack(spacing: 16) {
                            Button(action: {
                                words = viewModel.tagText(text: isEnglish ? viewModel.englishText : viewModel.japaneseText, filter: .all)
                            }) {
                                Text("Tag!")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.blue)
                            .cornerRadius(16)
                            
                            Button(action: {
                                isEnglish.toggle()
                            }) {
                                Text(isEnglish ? "日本語" : "English")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.purple)
                            .cornerRadius(16)
                            Button(action: {
                                words = viewModel.tagText(text: isEnglish ? viewModel.englishText : viewModel.japaneseText, filter: .all)
                            }) {
                                Text("全文")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.indigo)
                            .cornerRadius(16)
                            Button(action: {
                                words = viewModel.tagText(text: isEnglish ? viewModel.englishText : viewModel.japaneseText, filter: .verbs)
                            }) {
                                Text("動詞")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.indigo)
                            .cornerRadius(16)
                            Button(action: {
                                words = viewModel.tagText(text: isEnglish ? viewModel.englishText : viewModel.japaneseText, filter: .nouns)
                            }) {
                                Text("名詞")
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 16)
                            }
                            .background(Color.indigo)
                            .cornerRadius(16)
                        }
                        .padding(.bottom, 8)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(words) { taggedWord in
                                HStack {
                                    Text(taggedWord.word)
                                        .font(.title3)
                                        .frame(width: 140, height: 30)
                                        .padding(8)
                                        .background(.orange)
                                    Text(taggedWord.tag)
                                        .font(.title3)
                                        .frame(width: 140, height: 30)
                                        .padding(8)
                                        .background(.green)
                                }
                                .frame(height: 44, alignment: .leading)
                            }
                        }
                        .frame(width: 396, alignment: .leading)
                        
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Part-Of-Speech Tagging")
    }
}

struct PartOfSpeech_Previews: PreviewProvider {
    static var previews: some View {
        PartOfSpeech()
    }
}
