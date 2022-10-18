//
//  TextClassification.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct TextClassification: View {
    
    @StateObject var viewModel = TextClassificationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationTitle("Text Classification")
    }
}

struct TextClassification_Previews: PreviewProvider {
    static var previews: some View {
        TextClassification()
    }
}
