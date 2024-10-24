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
    
    // the topics below contain quiz items (courtesy of ChatGPT)
    let topics = [
        
        // Numbers
        Language.Topic(
            title: "Numbers",
            lessonText: """
                In this lesson, you'll learn how to count in Spanish. Here are the numbers 1 to 10:

                1. Uno
                2. Dos
                3. Tres
                4. Cuatro
                5. Cinco
                6. Seis
                7. Siete
                8. Ocho
                9. Nueve
                10. Diez

                For numbers beyond 10, here are a few examples:
                11. Once
                12. Doce
                13. Trece
                14. Catorce
                15. Quince
                20. Veinte
                30. Treinta
                100. Cien

                To form larger numbers, combine them:
                - 21: Veintiuno
                - 22: Veintidós
                - 31: Treinta y uno
                - 32: Treinta y dos
                - 100: Ciento (when not exactly 100)

                Practice by saying the numbers out loud to get used to the pronunciation!
            """,

            vocabulary: [
                Language.Term(
                    word: "uno",
                    translation: "one (1)"
                ),
                Language.Term(
                    word: "dos",
                    translation: "two (2)"
                ),
                Language.Term(
                    word: "tres",
                    translation: "three (3)"
                ),
                Language.Term(
                    word: "cuatro",
                    translation: "four (4)"
                ),
                Language.Term(
                    word: "cinco",
                    translation: "five (5)"
                ),
                Language.Term(
                    word: "seis",
                    translation: "six (6)"
                ),
                Language.Term(
                    word: "siete",
                    translation: "seven (7)"
                ),
                Language.Term(
                    word: "ocho",
                    translation: "eight (8)"
                ),
                Language.Term(
                    word: "nueve",
                    translation: "nine (9)"
                ),
                Language.Term(
                    word: "diez",
                    translation: "ten (10)"
                ),
                Language.Term(
                    word: "veinte",
                    translation: "twenty (20)"
                ),
                Language.Term(
                    word: "treinta",
                    translation: "thirty (30)"
                ),
                Language.Term(
                    word: "cuarenta",
                    translation: "forty (40)"
                ),
                Language.Term(
                    word: "cincuenta",
                    translation: "fifty (50)"
                ),
                Language.Term(
                    word: "sesenta",
                    translation: "sixty (60)"
                ),
                Language.Term(
                    word: "setenta",
                    translation: "seventy (70)"
                ),
                Language.Term(
                    word: "ochenta",
                    translation: "eighty (80)"
                ),
                Language.Term(
                    word: "noventa",
                    translation: "ninety (90)"
                ),
                Language.Term(
                    word: "cien",
                    translation: "one hundred (100)"
                ),
                Language.Term(
                    word: "uno",
                    translation: "one"
                ),            ],
            quiz: [
                Language.QuizItem(
                    question: "What is the Spanish word for the number 7?",
                    answers: ["Siete", "Seis", "Ocho"],
                    correctAnswer: "Siete"
                ),
                Language.QuizItem(
                    question: "How do you say '15' in Spanish?",
                    answers: ["Quince", "Diez", "Doce"],
                    correctAnswer: "Quince"
                ),
                Language.QuizItem(
                    question: "What number does 'veinte' represent?",
                    answers: ["10", "20", "30"],
                    correctAnswer: "20"
                ),
                Language.QuizItem(
                    question: "If 'nueve' is 9, what is 19 in Spanish?",
                    answers: ["Noventa", "Diecinueve", "Diez"],
                    correctAnswer: "Diecinueve"
                ),
                Language.QuizItem(
                    question: "What is the Spanish number for '100'?",
                    answers: ["Cincuenta", "Cien", "Mil"],
                    correctAnswer: "Cien"
                ),
                Language.QuizItem(
                    question: "Which of these is the correct translation of '42'?",
                    answers: ["Cuarenta y dos", "Veinte y dos", "Treinta y dos"],
                    correctAnswer: "Cuarenta y dos"
                ),
                Language.QuizItem(
                    question: "How do you say '31' in Spanish?",
                    answers: ["Treinta y uno", "Cuarenta y uno", "Veinte y uno"],
                    correctAnswer: "Treinta y uno"
                ),
                Language.QuizItem(
                    question: "What is the Spanish number for '50'?",
                    answers: ["Cincuenta", "Setenta", "Ochenta"],
                    correctAnswer: "Cincuenta"
                ),
                Language.QuizItem(
                    question: "What is the number '70' in Spanish?",
                    answers: ["Setenta", "Sesenta", "Noventa"],
                    correctAnswer: "Setenta"
                ),
                Language.QuizItem(
                    question: "How do you write the number 1000 in Spanish?",
                    answers: ["Mil", "Quinientos", "Ciento"],
                    correctAnswer: "Mil"
                )
            ]
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
                    question: "What is the Spanish word for 'apple'?",
                    answers: ["Manzana", "Naranja", "Plátano"],
                    correctAnswer: "Manzana"
                ),
                Language.QuizItem(
                    question: "How do you say 'bread' in Spanish?",
                    answers: ["Pan", "Leche", "Queso"],
                    correctAnswer: "Pan"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'cheese'?",
                    answers: ["Carne", "Queso", "Huevos"],
                    correctAnswer: "Queso"
                ),
                Language.QuizItem(
                    question: "Which of these is the Spanish word for 'orange'?",
                    answers: ["Plátano", "Naranja", "Manzana"],
                    correctAnswer: "Naranja"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'chicken'?",
                    answers: ["Pollo", "Pescado", "Carne"],
                    correctAnswer: "Pollo"
                ),
                Language.QuizItem(
                    question: "How do you say 'rice' in Spanish?",
                    answers: ["Frijoles", "Arroz", "Tortilla"],
                    correctAnswer: "Arroz"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'fish' (as food)?",
                    answers: ["Pescado", "Pollo", "Queso"],
                    correctAnswer: "Pescado"
                ),
                Language.QuizItem(
                    question: "Which of these means 'potato' in Spanish?",
                    answers: ["Papa", "Carne", "Tortilla"],
                    correctAnswer: "Papa"
                ),
                Language.QuizItem(
                    question: "How do you say 'egg' in Spanish?",
                    answers: ["Huevos", "Arroz", "Fruta"],
                    correctAnswer: "Huevos"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'milk'?",
                    answers: ["Leche", "Café", "Jugo"],
                    correctAnswer: "Leche"
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
                    question: "How do you say 'Hello' in Spanish?",
                    answers: ["Hola", "Adiós", "Gracias"],
                    correctAnswer: "Hola"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'Thank you'?",
                    answers: ["De nada", "Por favor", "Gracias"],
                    correctAnswer: "Gracias"
                ),
                Language.QuizItem(
                    question: "Which of these means 'Goodbye' in Spanish?",
                    answers: ["Hola", "Adiós", "Buenos días"],
                    correctAnswer: "Adiós"
                ),
                Language.QuizItem(
                    question: "How do you say 'Please' in Spanish?",
                    answers: ["Gracias", "Perdón", "Por favor"],
                    correctAnswer: "Por favor"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'Excuse me'?",
                    answers: ["De nada", "Perdón", "Buenas noches"],
                    correctAnswer: "Perdón"
                ),
                Language.QuizItem(
                    question: "Which phrase means 'How are you?' in Spanish?",
                    answers: ["¿Dónde estás?", "¿Cómo te llamas?", "¿Cómo estás?"],
                    correctAnswer: "¿Cómo estás?"
                ),
                Language.QuizItem(
                    question: "How do you say 'Good morning' in Spanish?",
                    answers: ["Buenas noches", "Buenos días", "Buenas tardes"],
                    correctAnswer: "Buenos días"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'I don't understand'?",
                    answers: ["No hablo español", "No entiendo", "Estoy bien"],
                    correctAnswer: "No entiendo"
                ),
                Language.QuizItem(
                    question: "How do you say 'Can you help me?' in Spanish?",
                    answers: ["¿Me puedes ayudar?", "¿Dónde está?", "¿Puedo pasar?"],
                    correctAnswer: "¿Me puedes ayudar?"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'I would like to order'?",
                    answers: ["Quiero pedir", "Necesito ayuda", "Puedo pagar"],
                    correctAnswer: "Quiero pedir"
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
                    question: "What is the Spanish word for 'shirt'?",
                    answers: ["Camisa", "Zapato", "Chaqueta"],
                    correctAnswer: "Camisa"
                ),
                Language.QuizItem(
                    question: "How do you say 'pants' in Spanish?",
                    answers: ["Sombrero", "Pantalones", "Falda"],
                    correctAnswer: "Pantalones"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'shoes'?",
                    answers: ["Calcetines", "Zapatos", "Guantes"],
                    correctAnswer: "Zapatos"
                ),
                Language.QuizItem(
                    question: "Which of these means 'dress' in Spanish?",
                    answers: ["Vestido", "Falda", "Abrigo"],
                    correctAnswer: "Vestido"
                ),
                Language.QuizItem(
                    question: "How do you say 'hat' in Spanish?",
                    answers: ["Sombrero", "Camisa", "Cinturón"],
                    correctAnswer: "Sombrero"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'jacket'?",
                    answers: ["Bufanda", "Chaqueta", "Gorra"],
                    correctAnswer: "Chaqueta"
                ),
                Language.QuizItem(
                    question: "Which of these means 'skirt' in Spanish?",
                    answers: ["Falda", "Pantalones", "Zapatos"],
                    correctAnswer: "Falda"
                ),
                Language.QuizItem(
                    question: "How do you say 'socks' in Spanish?",
                    answers: ["Cinturón", "Guantes", "Calcetines"],
                    correctAnswer: "Calcetines"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'gloves'?",
                    answers: ["Guantes", "Abrigo", "Zapatos"],
                    correctAnswer: "Guantes"
                ),
                Language.QuizItem(
                    question: "How do you say 'scarf' in Spanish?",
                    answers: ["Bufanda", "Cinturón", "Camisa"],
                    correctAnswer: "Bufanda"
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
            quiz: [
                Language.QuizItem(
                    question: "How do you say 'It's raining' in Spanish?",
                    answers: ["Está lloviendo", "Hace frío", "Hace sol"],
                    correctAnswer: "Está lloviendo"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'It's sunny'?",
                    answers: ["Está nublado", "Hace viento", "Hace sol"],
                    correctAnswer: "Hace sol"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'snow'?",
                    answers: ["Niebla", "Nieve", "Granizo"],
                    correctAnswer: "Nieve"
                ),
                Language.QuizItem(
                    question: "Which of these means 'It's windy' in Spanish?",
                    answers: ["Está nevando", "Hace viento", "Hace calor"],
                    correctAnswer: "Hace viento"
                ),
                Language.QuizItem(
                    question: "How do you say 'It's cold' in Spanish?",
                    answers: ["Hace calor", "Hace frío", "Está húmedo"],
                    correctAnswer: "Hace frío"
                ),
                Language.QuizItem(
                    question: "What is the Spanish phrase for 'It's snowing'?",
                    answers: ["Está nevando", "Está nublado", "Hace buen tiempo"],
                    correctAnswer: "Está nevando"
                ),
                Language.QuizItem(
                    question: "Which of these means 'It's cloudy' in Spanish?",
                    answers: ["Está despejado", "Hace sol", "Está nublado"],
                    correctAnswer: "Está nublado"
                ),
                Language.QuizItem(
                    question: "How do you say 'It's hot' in Spanish?",
                    answers: ["Hace frío", "Hace calor", "Está ventoso"],
                    correctAnswer: "Hace calor"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'storm'?",
                    answers: ["Tormenta", "Lluvia", "Granizo"],
                    correctAnswer: "Tormenta"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'fog'?",
                    answers: ["Viento", "Niebla", "Humedad"],
                    correctAnswer: "Niebla"
                )
            ]
        ),
        
        // Halloween special
        Language.Topic(
            title: "Halloween",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la calabaza", translation: "pumpkin")],
            quiz: [
                Language.QuizItem(
                    question: "What is the Spanish word for 'pumpkin'?",
                    answers: ["Bruja", "Calabaza", "Fantasma"],
                    correctAnswer: "Calabaza"
                ),
                Language.QuizItem(
                    question: "How do you say 'ghost' in Spanish?",
                    answers: ["Calavera", "Vampiro", "Fantasma"],
                    correctAnswer: "Fantasma"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'witch'?",
                    answers: ["Bruja", "Monstruo", "Esqueleto"],
                    correctAnswer: "Bruja"
                ),
                Language.QuizItem(
                    question: "Which of these means 'skeleton' in Spanish?",
                    answers: ["Esqueleto", "Calavera", "Araña"],
                    correctAnswer: "Esqueleto"
                ),
                Language.QuizItem(
                    question: "How do you say 'spider' in Spanish?",
                    answers: ["Murciélago", "Araña", "Vampiro"],
                    correctAnswer: "Araña"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'vampire'?",
                    answers: ["Murciélago", "Vampiro", "Fantasma"],
                    correctAnswer: "Vampiro"
                ),
                Language.QuizItem(
                    question: "Which of these means 'bat' in Spanish?",
                    answers: ["Araña", "Monstruo", "Murciélago"],
                    correctAnswer: "Murciélago"
                ),
                Language.QuizItem(
                    question: "How do you say 'monster' in Spanish?",
                    answers: ["Monstruo", "Bruja", "Esqueleto"],
                    correctAnswer: "Monstruo"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'skull'?",
                    answers: ["Esqueleto", "Calavera", "Calabaza"],
                    correctAnswer: "Calavera"
                ),
                Language.QuizItem(
                    question: "How do you say 'costume' in Spanish?",
                    answers: ["Disfraz", "Bruja", "Calabaza"],
                    correctAnswer: "Disfraz"
                )
            ]
        ),
        
        // Family
        Language.Topic(
            title: "Family",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la familia", translation: "family")],
            quiz: [
                Language.QuizItem(
                    question: "How do you say 'mother' in Spanish?",
                    answers: ["Hermana", "Madre", "Abuela"],
                    correctAnswer: "Madre"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'father'?",
                    answers: ["Padre", "Tío", "Abuelo"],
                    correctAnswer: "Padre"
                ),
                Language.QuizItem(
                    question: "How do you say 'brother' in Spanish?",
                    answers: ["Hermano", "Primo", "Hijo"],
                    correctAnswer: "Hermano"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'sister'?",
                    answers: ["Tía", "Hermana", "Prima"],
                    correctAnswer: "Hermana"
                ),
                Language.QuizItem(
                    question: "Which of these means 'grandfather' in Spanish?",
                    answers: ["Primo", "Abuelo", "Sobrino"],
                    correctAnswer: "Abuelo"
                ),
                Language.QuizItem(
                    question: "How do you say 'grandmother' in Spanish?",
                    answers: ["Abuela", "Madre", "Prima"],
                    correctAnswer: "Abuela"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'uncle'?",
                    answers: ["Tío", "Sobrino", "Hermano"],
                    correctAnswer: "Tío"
                ),
                Language.QuizItem(
                    question: "Which of these means 'aunt' in Spanish?",
                    answers: ["Tía", "Madre", "Prima"],
                    correctAnswer: "Tía"
                ),
                Language.QuizItem(
                    question: "How do you say 'son' in Spanish?",
                    answers: ["Hijo", "Nieto", "Hermano"],
                    correctAnswer: "Hijo"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'daughter'?",
                    answers: ["Hermana", "Sobrina", "Hija"],
                    correctAnswer: "Hija"
                )
            ]
        ),
        
        // School
        Language.Topic(
            title: "School",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "la escuela", translation: "school")],
            quiz: [
                Language.QuizItem(
                    question: "How do you say 'school' in Spanish?",
                    answers: ["Escuela", "Clase", "Biblioteca"],
                    correctAnswer: "Escuela"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'teacher'?",
                    answers: ["Estudiante", "Profesor", "Escuela"],
                    correctAnswer: "Profesor"
                ),
                Language.QuizItem(
                    question: "How do you say 'student' in Spanish?",
                    answers: ["Estudiante", "Clase", "Maestro"],
                    correctAnswer: "Estudiante"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'class'?",
                    answers: ["Clase", "Silla", "Mesa"],
                    correctAnswer: "Clase"
                ),
                Language.QuizItem(
                    question: "Which of these means 'book' in Spanish?",
                    answers: ["Cuaderno", "Libro", "Lápiz"],
                    correctAnswer: "Libro"
                ),
                Language.QuizItem(
                    question: "How do you say 'notebook' in Spanish?",
                    answers: ["Cuaderno", "Carpeta", "Hoja"],
                    correctAnswer: "Cuaderno"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'pencil'?",
                    answers: ["Lápiz", "Tiza", "Pluma"],
                    correctAnswer: "Lápiz"
                ),
                Language.QuizItem(
                    question: "Which of these means 'folder' in Spanish?",
                    answers: ["Carpeta", "Libreta", "Tijeras"],
                    correctAnswer: "Carpeta"
                ),
                Language.QuizItem(
                    question: "How do you say 'chalk' in Spanish?",
                    answers: ["Tiza", "Lápiz", "Marcador"],
                    correctAnswer: "Tiza"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'scissors'?",
                    answers: ["Tijeras", "Cinta", "Pegamento"],
                    correctAnswer: "Tijeras"
                )
            ]
        ),
        
        // Body
        Language.Topic(
            title: "Body",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "el cuerpo", translation: "body")],
            quiz: [
                Language.QuizItem(
                    question: "How do you say 'head' in Spanish?",
                    answers: ["Cabeza", "Mano", "Brazo"],
                    correctAnswer: "Cabeza"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'hand'?",
                    answers: ["Pierna", "Mano", "Pie"],
                    correctAnswer: "Mano"
                ),
                Language.QuizItem(
                    question: "How do you say 'leg' in Spanish?",
                    answers: ["Pierna", "Brazo", "Cabeza"],
                    correctAnswer: "Pierna"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'foot'?",
                    answers: ["Dedo", "Pie", "Pierna"],
                    correctAnswer: "Pie"
                ),
                Language.QuizItem(
                    question: "Which of these means 'arm' in Spanish?",
                    answers: ["Pierna", "Brazo", "Mano"],
                    correctAnswer: "Brazo"
                ),
                Language.QuizItem(
                    question: "How do you say 'eye' in Spanish?",
                    answers: ["Nariz", "Boca", "Ojo"],
                    correctAnswer: "Ojo"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'nose'?",
                    answers: ["Oreja", "Nariz", "Ojo"],
                    correctAnswer: "Nariz"
                ),
                Language.QuizItem(
                    question: "Which of these means 'ear' in Spanish?",
                    answers: ["Ojo", "Nariz", "Oreja"],
                    correctAnswer: "Oreja"
                ),
                Language.QuizItem(
                    question: "How do you say 'mouth' in Spanish?",
                    answers: ["Boca", "Dedo", "Mano"],
                    correctAnswer: "Boca"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'finger'?",
                    answers: ["Dedo", "Pie", "Ojo"],
                    correctAnswer: "Dedo"
                )
            ]
        ),
        
        // Animals
        Language.Topic(
            title: "Animals",
            lessonText: "testing",
            vocabulary: [Language.Term(word: "el animal", translation: "animal")],
            quiz: [
                Language.QuizItem(
                    question: "How do you say 'dog' in Spanish?",
                    answers: ["Gato", "Perro", "Pájaro"],
                    correctAnswer: "Perro"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'cat'?",
                    answers: ["Gato", "Rata", "Conejo"],
                    correctAnswer: "Gato"
                ),
                Language.QuizItem(
                    question: "How do you say 'bird' in Spanish?",
                    answers: ["Perro", "Gato", "Pájaro"],
                    correctAnswer: "Pájaro"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'rabbit'?",
                    answers: ["Perro", "Gato", "Conejo"],
                    correctAnswer: "Conejo"
                ),
                Language.QuizItem(
                    question: "Which of these means 'fish' in Spanish?",
                    answers: ["Pez", "Tortuga", "Rana"],
                    correctAnswer: "Pez"
                ),
                Language.QuizItem(
                    question: "How do you say 'turtle' in Spanish?",
                    answers: ["Rana", "Tortuga", "Serpiente"],
                    correctAnswer: "Tortuga"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'snake'?",
                    answers: ["Serpiente", "Lobo", "Ratón"],
                    correctAnswer: "Serpiente"
                ),
                Language.QuizItem(
                    question: "Which of these means 'wolf' in Spanish?",
                    answers: ["Oso", "Lobo", "Gato"],
                    correctAnswer: "Lobo"
                ),
                Language.QuizItem(
                    question: "How do you say 'mouse' in Spanish?",
                    answers: ["Ratón", "Gato", "Perro"],
                    correctAnswer: "Ratón"
                ),
                Language.QuizItem(
                    question: "What is the Spanish word for 'bear'?",
                    answers: ["Oso", "León", "Elefante"],
                    correctAnswer: "Oso"
                )
            ]
        )
    ]
    
    // MARK: - Mutable Properities
    
    var progress: [Language.Progress]
    
    // MARK: - Helpers
    // NEEDWORK: implement helpers to update progress as needed
}
