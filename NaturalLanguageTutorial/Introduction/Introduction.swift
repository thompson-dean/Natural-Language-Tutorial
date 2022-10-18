//
//  Introduction.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Introduction: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red
                    .ignoresSafeArea(.all)
                VStack {
                    Text("INTRODUCTION")
                }
            }
        }
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
