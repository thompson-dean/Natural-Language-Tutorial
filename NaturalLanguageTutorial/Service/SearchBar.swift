//
//  SearchBar.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/20.
//

import Foundation

import SwiftUI

struct SearchBar: View {

    @Binding var text: String

    var body: some View {
        VStack {

            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 239 / 255,
                                green: 239 / 255,
                                blue: 241 / 255))
                    .frame(height: 36)

                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)

                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                
                    TextField("Search", text: $text)
                        .foregroundColor(.black)
                        

                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
