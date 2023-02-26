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
        VStack(spacing: 40) {
            HStack {
                Text("Qiuz Game")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                if !gameManager.isFetching {
                    Text("\(gameManager.index + 1) out of \(gameManager.length)")
                        .foregroundColor(Color("AccentColor"))
                        .fontWeight(.heavy)
                        .frame(width: 120, alignment: .trailing)
                }
            }.padding(.top)
            
            if gameManager.isFetching {
                Spacer()
                
                Spinner()
                
                Spacer()
            } else {
                ProgressBar(progress: gameManager.progress)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(gameManager.question.string) // todo
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color("AccentColor"))
                        .lineLimit(8)
                        .minimumScaleFactor(0.7)
                    
                    ForEach(gameManager.answerChoices, id: \.id) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(gameManager)
                    }
                }
                
                Button(action: {
                    gameManager.goToNextQuestion()
                }, label: {
                    PrimaryButton(text: "Next", background: gameManager.answerSelected ? Color("AccentColor") : .gray)
                })
                .disabled(!gameManager.answerSelected)
                
                Spacer()
            }  
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Constants.backColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(GameManager())
    }
}
