//
//  LessonTopicView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI

struct LessonTopicView: View {
    
    //@State private var selection: Int = 0
    
    var topic: Language.Topic
    
    var body: some View {
        Text("More info on \(topic.title)")
            .navigationTitle(topic.title)
        
        NavigationView {
            TabView() { //selection: $selection
                //Color.blue
                HomeScreenView(languageViewModel: LanguageViewModel())
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                //Color.blue
                LessonView()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Lesson")
                    }
                //Color.blue
                FlashcardView()
                    .tabItem {
                        Image(systemName: "rectangle.stack")
                        Text("Flashcards")
                    }
                //Color.blue
                QuizView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Quiz")
                    }
                }
            .background(Color.lightTan)
        }
    }
}
       
