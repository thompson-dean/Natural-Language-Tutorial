//
//  Introduction.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Introduction: View {
    
    @StateObject var viewModel = IntroductionViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("INTRODUCTION")
            }
        }
        .navigationTitle("Introduction to NLP")
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
