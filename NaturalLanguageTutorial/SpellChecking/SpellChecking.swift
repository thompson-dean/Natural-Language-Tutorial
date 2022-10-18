//
//  SpellChecking.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct SpellChecking: View {
    
    @StateObject var viewModel = SpellCheckingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .navigationTitle("Spell Checking")
    }
}

struct SpellChecking_Previews: PreviewProvider {
    static var previews: some View {
        SpellChecking()
    }
}
