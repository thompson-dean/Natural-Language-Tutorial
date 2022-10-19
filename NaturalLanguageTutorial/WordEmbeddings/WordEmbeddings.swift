//
//  WordEmbeddings.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct WordEmbeddings: View {
    
    @StateObject var viewModel = WordEmbeddingsViewModel()
    @State private var isShowingExample: Bool = false
    @State private var isShowingReal: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("What are Word Embeddings?")
                        .font(.largeTitle)
                        .bold()
                    Text("分散表現とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("レンマ化は、トークンを辞書の見出し語に変換する処理です。例えば、 「builds」、 「building」、「built」をレンマ化で　→「build」（辞書形）。日本語だったら、「食べた」、「食べたい」「食べさせられた」をレンマ化で　→　「？？？」")
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
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Lemmatization")
    }
}

struct WordEmbeddings_Previews: PreviewProvider {
    static var previews: some View {
        WordEmbeddings()
    }
}
