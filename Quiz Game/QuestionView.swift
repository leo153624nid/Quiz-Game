//
//  QuestionView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack {
                Text("Qiuz Game")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                Text("\(gameManager.index + 1) out of \(gameManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: gameManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(gameManager.question.string)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("AccentColor"))
                
                ForEach(gameManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(gameManager)
                    
                }
                
                AnswerRow(answer: Answer(text: NSAttributedString(string: "111"), isCorrect: false))
                    .environmentObject(gameManager)
                
              
            }
            
            PrimaryButton(text: "Next")
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(GameManager(difficulty: .hard))
    }
}
