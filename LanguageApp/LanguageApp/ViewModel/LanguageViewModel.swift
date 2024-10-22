//
//  LanguageViewModel.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import Foundation

@Observable class LanguageViewModel {
    
    // MARK: - Properties
    
    private var lessonPlan: LessonPlan = SpanishLessonPlan(progress: [])
    
    // MARK: - Model Access
    
    var languageName: String {
        lessonPlan.languageName
    }
    
    var topics: [Language.Topic] {
        lessonPlan.topics
    }
    
    // MARK: - User Intents
    
    
    // MARK: - Private Helpers
}
