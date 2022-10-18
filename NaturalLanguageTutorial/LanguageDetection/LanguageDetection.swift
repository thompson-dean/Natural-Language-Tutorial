//
//  LanguageDetection.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct LanguageDetection: View {
    
    @StateObject var viewModel = LanguageDetectionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationTitle("Language Detection")
    }
}

struct LanguageDetection_Previews: PreviewProvider {
    static var previews: some View {
        LanguageDetection()
    }
}
