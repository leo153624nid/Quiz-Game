//
//  GameView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject var gameManager = GameManager()
    var difficulty: Int
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        if gameManager.endGame {
            VStack(spacing: 20) {
                Text("Quiz Game")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("Твой счет: \(gameManager.score) из \(gameManager.length)")
                
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {
                    PrimaryButton(text: "Play again")
                })
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
            .navigationBarHidden(true)
        } else {
            QuestionView()
                .navigationBarHidden(true)
                .environmentObject(gameManager)
                .onAppear(perform: {
                    setDifficulty()
                    gameManager.fetchGame()
                })
        }  
    }
    
    private func setDifficulty() {
        switch difficulty {
            case 0: gameManager.difficulty = .easy
            case 1: gameManager.difficulty = .medium
            case 2: gameManager.difficulty = .hard
            default: print("error setup difficulty")
        }
        print("difficulty = \(gameManager.difficulty.rawValue)")
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(difficulty: 0)
    }
}
