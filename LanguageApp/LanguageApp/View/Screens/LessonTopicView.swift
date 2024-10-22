//
//  LessonTopicView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI

struct LessonTopicView: View {
    var topic: Language.Topic
    
    var body: some View {
        Text("More info on \(topic.title)")
            .navigationTitle(topic.title)
        
    }
}
