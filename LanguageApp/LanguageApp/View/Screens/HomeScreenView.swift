//
//  HomeScreenView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/17/24.
//

import SwiftUI


struct HomeScreenView: View {
    var languageViewModel: LanguageViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        //Image("LearntheLingoAppLogo")
        //    .resizable()
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(languageViewModel.topics, id: \.self) { topic in
                        NavigationLink(destination: LessonTopicView(topic: topic)) {
                            ZStack {
                                Rectangle()
                                    .frame(width: 170, height: 170)
                                    .foregroundColor(.secondary)
                                    .cornerRadius(30)
                                //.shadow(radius: 10, x: 0, y: 10)
                                Text(topic.title)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .padding()
            //.navigationTitle("Learn \(languageViewModel.languageName)!")
            .navigationBarTitleDisplayMode(.inline) // Set title to inline
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("TransparentLogoLingo") // Replace with your custom image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 80)
                        Spacer()
                    }
                }
            }
            .background(Color.lightTan)
        }
    }
}

#Preview {
    HomeScreenView(languageViewModel: LanguageViewModel())
    
}
