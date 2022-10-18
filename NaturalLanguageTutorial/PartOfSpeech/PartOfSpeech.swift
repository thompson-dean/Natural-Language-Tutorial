//
//  PartOfSpeech.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct PartOfSpeech: View {
    
    @StateObject var viewModel = PartOfSpeechViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
