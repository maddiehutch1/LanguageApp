//
//  LessonTopicView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI

struct LessonTopicView: View {
    
    @State private var selection: String = "Home"
    
    var topic: Language.Topic
    
    var body: some View {
        Text("More info on \(topic.title)")
            .navigationTitle(topic.title)
        
        TabView(selection: $selection) {
            Color.blue
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "house")
                    Text("Lesson")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "house")
                    Text("Flashcards")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Quiz")
                }
        }
        
        
        
    }
}
