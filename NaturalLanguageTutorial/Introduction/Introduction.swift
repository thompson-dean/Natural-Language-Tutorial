//
//  Introduction.swift
//  NaturalLanguageTutorial
//
//  Created by Thompson Dean on 2022/10/18.
//

import SwiftUI

struct Introduction: View {
    
    @StateObject var viewModel = IntroductionViewModel()
    @State var isShowingAims: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Natural Language Processing in Swift")
                        .font(.largeTitle)
                        .bold()
                    Text("Swiftでの自然言語処理")
                        .font(.largeTitle)
                        .bold()
                    Text("Dean Thompson. Arsaga Partners App Division")
                        .padding(.bottom, 36)
                    Text("自然言語処理とは")
                        .font(.title)
                        .bold()
                    Text("自然言語処理は、人間が日常的に使っている自然言語をコンピュータに処理させる一連の技術であり、人工知能と言語学の一分野である。")
                        .font(.title2)
                        .padding(.trailing, 380)
                        .padding(.bottom, 36)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Button {
                        withAnimation {
                            isShowingAims.toggle()
                        }
                    } label: {
                        HStack(spacing: 0) {
                            Text(isShowingAims ? "プレゼンの目的 " : "プレゼンの目的 ")
                                .font(.title)
                            Image(systemName: isShowingAims ? "chevron.up" : "chevron.down")
                        }
                        .bold()
                    }
                    
                    if isShowingAims {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("1. 一般的な自然言語処理タスクを紹介")
                                .font(.title2)
                            Text("2. 一般的なタスクをSwiftで実装する方法を紹介")
                                .font(.title2)
                            Text("3. 各タスクの実用例を紹介")
                                .font(.title2)
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: . infinity, alignment: .leading)
            }
        }
        .navigationTitle("Introduction")
    }
}

struct Introduction_Previews: PreviewProvider {
    static var previews: some View {
        Introduction()
    }
}
