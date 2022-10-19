//
//  Tokenization.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Tokenization: View {
    
    @StateObject var viewModel = TokenizationViewModel()
    @State var isEnglish: Bool = true
    @State var isWord: Bool = true
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is Tokenization?")
                        .font(.largeTitle)
                        .bold()
                    Text("トークン化とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("テキストは通常、プログラムの中で「文字列」として表現される。トークン化は、この文字列をどのように単位（段落、文、単語など）に分割するかという問題を処理するものである。")
                        .font(.title2)
                        .padding(.trailing, 380)
                        .padding(.bottom, 8)
                    VStack(alignment: .leading, spacing: 24) {
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
                            Image("tokenization_code_1")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(8)
                                .frame(width: 1200, height: 540)
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
                                    viewModel.tokenizeSentence(text: isEnglish ? viewModel.englishText : viewModel.japaneseText, unit: isWord ? .word : .sentence)
                                }) {
                                    Text("Tokenize!")
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
                                    isWord.toggle()
                                }) {
                                    Text(isWord ? "文章" : "言葉")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                }
                                .background(Color.pink)
                                .cornerRadius(16)
                            }
                            .padding(.bottom, 8)
                            
                            if !viewModel.tokens.isEmpty {
                                LazyVGrid(columns: columns) {
                                    ForEach(viewModel.tokens) { token in
                                        NavigationLink {
                                            WordView(word: token.string)
                                        } label: {
                                            Text(token.string)
                                                .padding(8)
                                                .foregroundColor(.white)
                                                .frame(width: UIScreen.main.bounds.width / 10)
                                                .background(.red)
                                                .cornerRadius(4)
                                        }
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width)
                            }
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        
        .navigationTitle("Tokenization")
    }
}

struct Tokenization_Previews: PreviewProvider {
    static var previews: some View {
        Tokenization()
    }
}


// Speech 一見すると、とても簡単そうに見える。ただ単語と単語の間にスペースを探すだけだね？、、、英語・フランス語だと、それはいけるけど、日本語や中国語のような言語では、これは非常に難しく、NLPの助けが必要だ。 ensures correct behavior in multiple scripts and languages


struct WordView: View {
    let word: String
    var body: some View {
        VStack {
            Text(word)
                .font(.system(size: 72, weight: .bold))
        }
    }
}
