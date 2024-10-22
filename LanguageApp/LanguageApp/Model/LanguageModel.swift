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
    struct Topic: Identifiable, Hashable {
        let id = UUID()
        let title: String
        let lessonText: String
        let vocabulary: [Term]
        let quiz: [QuizItem]
    }
    
    struct Term: Hashable, Equatable {
        let word: String
        let translation: String
    }
    
    struct QuizItem: Hashable, Equatable {
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
        
        // Numbers
        Language.Topic(
            title: "Numbers",
            lessonText: "testing",
            vocabulary: [
                Language.Term(
                    word: "uno",
                    translation: "one"
                )],
            quiz: [
                Language.QuizItem(
                    question: "question?",
                    answers: ["a", "b", "c"],
                    correctAnswer: "b"
                )]
        ),
        
        // Food
        Language.Topic(
            title: "Food",
            lessonText: "testing",
            vocabulary: [
                Language.Term(
                    word: "la comida",
                    translation: "food"
                )],
            quiz: [
                Language.QuizItem(
                    question: "question?",
                    answers: ["a", "b", "c"],
                    correctAnswer: "b"
                )]
        ),
        
        // Must-Know Phrases
        Language.Topic(
            title: "Must-Know Phrases",
            lessonText: "testing",
            vocabulary: [
                Language.Term(
                    word: "Como estas?",
                    translation: "How are you? (informal)"
                )],
            quiz: [
                Language.QuizItem(
                    question: "question?",
                    answers: ["a", "b", "c"],
                    correctAnswer: "b"
                )]
        ),
        
        // Clothing
        Language.Topic(
            title: "Clothing",
            lessonText: "testing",
            vocabulary: [
                Language.Term(
                    word: "la ropa",
                    translation: "clothes"
                )],
            quiz: [
                Language.QuizItem(
                    question: "question?",
                    answers: ["a", "b", "c"],
                    correctAnswer: "b"
                )]
        ),
        
        // Weather
        Language.Topic(
            title: "Weather",
            lessonText: "testing",
            vocabulary: [
                Language.Term(
                    word: "la lluvia",
                    translation: "rain"
                )],
            quiz: [Language.QuizItem(
                question: "question?",
                answers: ["a", "b", "c"],
                correctAnswer: "b"
            )]
        ),
        
        // Halloween special
        Language.Topic(
            title: "Halloween",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la calabaza", translation: "pumpkin")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        ),
        
        // Family
        Language.Topic(
            title: "Family",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la familia", translation: "family")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        ),
        
        // School
        Language.Topic(
            title: "School",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la escuela", translation: "school")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        ),
        
        // Body
        Language.Topic(
            title: "Body",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "el cuerpo", translation: "body")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        ),
        
        // Animals
        Language.Topic(
            title: "Animals",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "el animal", translation: "animal")],
            quiz: [Language.QuizItem(question: "question?", answers: ["a", "b", "c"], correctAnswer: "b")]
        )
    ]
    
    // MARK: - Mutable Properities
    
    var progress: [Language.Progress]
    
    // MARK: - Helpers
    // NEEDWORK: implement helpers to update progress as needed
}
