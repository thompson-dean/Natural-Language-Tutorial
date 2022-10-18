//
//  Lemmatization.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Lemmatization: View {
    
    @StateObject var viewModel = LemmatizationViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
