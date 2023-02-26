//
//  ContentView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var difficulty = 0
    private let difficultyArray = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Quiz Game")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("AccentColor"))
                    
                    Text("Ты готов проверить свою эрудицию?")
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink(
                    destination: GameView(difficulty: difficulty),
                    label: {
                        PrimaryButton(text: "Start")
                    })
                    .navigationBarHidden(true)
                
                Text("Выбранная сложность:")
                    .foregroundColor(Color("AccentColor"))
                
                Picker(selection: $difficulty,
                       label: Text("")) {
                    ForEach(0..<difficultyArray.count) {
                            Text(difficultyArray[$0])
                                .foregroundColor(Color("AccentColor"))
                        }
                       }.frame(width: 100, height: 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Constants.backColor)
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
