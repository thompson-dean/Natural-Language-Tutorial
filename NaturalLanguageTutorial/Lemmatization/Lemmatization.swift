//
//  Lemmatization.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Lemmatization: View {
    
    @StateObject var viewModel = LemmatizationViewModel()
    @State var isEnglish: Bool = true
    @State var isWord: Bool = true
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What is Lemmatization?")
                        .font(.largeTitle)
                        .bold()
                    Text("レンマ化・見出語解析とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("レンマ化は、トークンを辞書の見出し語に変換する処理です。例えば、 「builds」、 「building」、「built」をレンマ化 して　→「build」（辞書形）。日本語だったら、「食べた」、「食べたい」「食べさせられた」をレンマ化で　→　「？？？」")
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
                            Image("lemmatization_code_1")
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
                                .frame(width: 900, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            HStack(spacing: 16) {
                                Button(action: {
                                    viewModel.lemmatizeText(text: isEnglish ? viewModel.englishText : viewModel.japaneseText)
                                }) {
                                    Text("Lemmatize!")
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
                                .background(Color.blue)
                                .cornerRadius(16)
                            }
                            if !viewModel.lemmas.isEmpty {
                                ForEach(viewModel.lemmas, id: \.id) { lemma in
                                    VStack(alignment: .leading) {
                                        Text("「\(lemma.token)」をレンマ化をしたら、「\(lemma.tag)」になります")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                    }
                                }
                            }
                        }
                        
                    }
                    .frame(alignment: .leading)
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Lemmatization")
    }
}

struct Lemmatization_Previews: PreviewProvider {
    static var previews: some View {
        Lemmatization()
    }
}
