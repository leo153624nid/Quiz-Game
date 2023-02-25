//
//  AnswerRow.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var gameManager : GameManager
    
    var answer: Answer
    
    @State private var isSelected = false
    
    var body: some View {
        let picName = answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill"
        let picColor = answer.isCorrect ? Color.green : Color.red
        let rowColor = isSelected ? Color("AccentColor") : Color.gray
        let shadowColor = answer.isCorrect ? Color.green : Color.red
        
        
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text.string)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: picName)
                    .foregroundColor(picColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(gameManager.answerSelected ? rowColor : Color("AccentColor"))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? shadowColor : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !gameManager.answerSelected {
                isSelected = true
                gameManager.selectAnswer(answer: answer)
            }
            
        }

    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: NSAttributedString(string: "111"), isCorrect: false))
            .environmentObject(GameManager(difficulty: .hard))
    }
}
