//
//  LanguageModel.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import Foundation

// include here info on Language and Topic (lesson, vocab, quiz, etc.)
protocol LessonPlan {
    var languageName: String { get }
    var topics: [Language.Topic] { get }
    var progress: [Language.Progress] { get set }
}

struct Language {
    // make sure to include Identifiable so it acts as distinct records
    struct Topic: Identifiable {
        let id = UUID()
        let title: String
        let lessonText: String
        let vocabulary: [Term]
        let quiz: [QuizItem]
    }
    
    struct Term {
        let word: String
        let translation: String
    }
    
    struct QuizItem {
        let question: String
        let answers: [String]
        let correctAnswer: String
    }
    
    struct Progress {
        let topicId: UUID
        var lessonRead = false
        var vocabStudied = false
        var quizPassed = false
        var quizHighScore: Int?
    }
}

extension Language.Progress: Identifiable {
    var id: UUID { topicId }
}

struct SpanishLessonPlan: LessonPlan {
    
    // MARK: - Read only properties
    let languageName = "Spanish"
    let topics = [
        Language.Topic(
            title: "Numbers",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "uno", translation: "one")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        )
    ]
    
    // MARK: - Mutable Properities
    
    var progress: [Language.Progress]
    
    // MARK: - Helpers
    // NEEDWORK: implement helpers to update progress as needed
}
