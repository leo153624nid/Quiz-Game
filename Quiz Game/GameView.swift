//
//  GameView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct GameView: View {
//    @StateObject var gameManager : GameManager
    @EnvironmentObject var gameManager : GameManager
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
        }  
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
