//
//  HomeScreenView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/17/24.
//

import SwiftUI

struct HomeScreenView: View {
    var languageViewModel: LanguageViewModel
    
    var body: some View {
        NavigationStack {
            List(languageViewModel.topics) {
                topic in Text(topic.title)
            }
            .listStyle(.plain)
            .navigationTitle("Learn \(languageViewModel.languageName)!")
        }
    }
}

#Preview {
    HomeScreenView(languageViewModel: LanguageViewModel())
    
}
