//
//  FlashcardView.swift
//  LanguageApp
//
//  Created by IS 543 on 10/22/24.
//

import SwiftUI

struct CardView: View {
    
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
           if isFaceUp {
               RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
               RoundedRectangle(cornerRadius: 10)
                   .stroke(.orange)
               Text("answer")
                    .font(.largeTitle)
           } else {
               RoundedRectangle(cornerRadius: 10)
                    .fill(.orange)
               Text("question")
                    .font(.largeTitle)
            }
            
        }
        .foregroundStyle(.black)
        .frame(maxWidth: 350, maxHeight: 250)
        .shadow(radius: 10, y: 10)
    }
}

struct FlashcardView: View {
    
    let numbers: [Int] = Array(1...20)
    
    var body: some View {
        TabView {
            // find a way to connect to database
            ForEach(numbers, id: \.self) { card in
                CardView(isFaceUp: false)
//                    .onTapGesture {
//                        rotate
//                    }
            }
        }
        .tabViewStyle(.page)
        .background(Color.lightTan)
    }
}



#Preview {
    FlashcardView()
}
