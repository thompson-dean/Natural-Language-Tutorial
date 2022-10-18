//
//  NamedEntity.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct NamedEntity: View {
    
    @StateObject var viewModel = NamedEntityViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationTitle("Named Entity Recognition")
    }
}

struct NamedEntity_Previews: PreviewProvider {
    static var previews: some View {
        NamedEntity()
    }
}
