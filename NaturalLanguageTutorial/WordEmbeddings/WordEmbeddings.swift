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
                    Text("分散表現・埋め込み表現とは？")
                        .font(.largeTitle)
                        .bold()
                    Text("分散表現とは単語をベクトルで表現した際のベクトルのこと。ベクトルがn次元である場合に、単語をn次元空間のある1点に埋め込むことを意味するため、埋め込み表現（Word Embedding）とも呼ばれる。")
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
                        Image("vector_1")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1300, height: 500)
                        Image("vector_2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1300, height: 500)
                        Image("vector_3")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                            .frame(width: 1300, height: 312)
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
                        SearchBar(text: $viewModel.text)
                            .frame(width: 300)
                            .onChange(of: viewModel.text) { newValue in
                                viewModel.retrieveNeighbours(text: newValue.lowercased())
                            }
                        
//                        Button {
//                            viewModel.retrieveNeighbours(text: viewModel.text.lowercased())
//                        } label: {
//                            Text("似てる単語を探す")
//                                .font(.title3)
//                                .foregroundColor(.white)
//                                .padding(.vertical, 8)
//                                .padding(.horizontal, 16)
//                        }
//                        .background(Color.blue)
//                        .cornerRadius(16)
//                        .padding(8)
                            
                        List(viewModel.possibleSearchWords, id: \.self) { word in
                            Text(word)
                        }
                        .frame(width: 300, height: 1000)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
                .padding(.horizontal, 20)
            }
        }
        .navigationTitle("Word Embeddings")
    }
}

struct WordEmbeddings_Previews: PreviewProvider {
    static var previews: some View {
        WordEmbeddings()
    }
}
