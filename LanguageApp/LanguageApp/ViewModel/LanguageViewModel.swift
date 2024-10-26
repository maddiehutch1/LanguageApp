//
//  LanguageViewModel.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI

@Observable class LanguageViewModel {

    // MARK: - Properties
    
    private var lessonPlan: LessonPlan = SpanishLessonPlan()
    
    // HELP HERE -- how do I get the cards to flip (made instance below)
    private var cardFlip = Flashcards<String>(cards: [])
    
    var selectedTopic: Language.Topic?

    // MARK: - Model Access
    
    var languageName: String {
        lessonPlan.languageName
    }
    
    var topics: [Language.Topic] {
        lessonPlan.topics
    }

    var lessonMaterial: String {
        //lessonPlan.topics.first?.lessonText ?? "No lesson material available."
        selectedTopic?.lessonText ?? "No lesson material available."
    }
    
    var question: String {
        //selectedTopic?.quiz.first?.question ?? "No question available."
        lessonPlan.topics.first?.quiz.first?.question ?? "No question available."
    }
    
    var options: [String] {
        //selectedTopic?.quiz.first?.question ?? "No question available."
        lessonPlan.topics.first?.quiz.first?.answers ?? []
    }
    
    var cards: Array<Flashcards<String>.Card> {
        cardFlip.cards
    }
    
    
    func progress(for title: String) -> Language.Progress {
        if let progressRecord = lessonPlan.progress.first(where: { $0.topicTitle == title }) {
            return progressRecord
        }
        
        let progressRecord = Language.Progress(topicTitle: title)
        
        lessonPlan.progress.append(progressRecord)
        
        return progressRecord
    }
    
    // MARK: - User Intents
    
    func flip(card: Flashcards<String>.Card) {
        cardFlip.flip(card: card)
    }
    
    func selectTopic(_ topic: Language.Topic) {
        selectedTopic = topic
    }
    
    func toggleLessonRead(for title: String) {
        lessonPlan.toggleLessonRead(for: title)
    }
    
    // MARK: - Private Helpers
}
