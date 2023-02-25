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
        QuestionView()
            .navigationBarHidden(true)
            .environmentObject(gameManager)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(GameManager(difficulty: .hard))
    }
}
