//
//  WordEmbeddings.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct WordEmbeddings: View {
    
    @StateObject var viewModel = WordEmbeddingsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
