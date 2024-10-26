//
//  QuizView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI


struct QuizView: View {
    var languageViewModel: LanguageViewModel
    var body: some View {
        VStack {
            Text(languageViewModel.question)
            ForEach(languageViewModel.options, id: \.self) { option in
//                Button() {
//                    print(option)
//                } label
            }
        }
        .navigationTitle("Quiz")
        .background(Color.lightTan)
    }
}

#Preview {
    QuizView(languageViewModel: LanguageViewModel())
}
