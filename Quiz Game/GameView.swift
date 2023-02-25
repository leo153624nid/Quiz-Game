//
//  GameView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameManager : GameManager
    
    var body: some View {
        if gameManager.endGame {
            VStack(spacing: 20) {
                Text("Quiz Game")
                    .font(.title)
                    .fontWeight(.heavy)
//                    .foregroundColor(Color("AccentColor"))
                
                Text("Твой счет: \(gameManager.score) из \(gameManager.length)")
//                    .foregroundColor(Color("AccentColor"))
                
                Button(action: {
                    // todo
                }, label: {
                    PrimaryButton(text: "Play again")
                })
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, minHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .navigationBarHidden(true)
                .environmentObject(gameManager)
        }  
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameManager(difficulty: .hard))
    }
}
