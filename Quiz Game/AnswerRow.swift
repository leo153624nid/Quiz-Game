//
//  AnswerRow.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct AnswerRow: View {
    var answer: Answer
    
    @State private var isSelected = false
    
    var body: some View {
        let picName = answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill"
        let picColor = answer.isCorrect ? Color.green : Color.red
        
        
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.text)
                .bold()
            
            if isSelected {
                Spacer()
                
                Image(systemName: picName)
                    .foregroundColor(picColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color("AccentColor"))
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            isSelected = true
        }

    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "11", isCorrect: false))
    }
}
