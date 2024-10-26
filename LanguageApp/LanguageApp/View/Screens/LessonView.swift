//
//  LessonView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/24/24.
//

import SwiftUI

struct LessonView: View {
    var languageViewModel: LanguageViewModel
    
    var body: some View {
        VStack {
            Text(languageViewModel.lessonMaterial)
        }
        .navigationTitle("Lesson")
        .background(Color.lightTan)
    }
    
}

#Preview {
    LessonView(languageViewModel: LanguageViewModel())
}
