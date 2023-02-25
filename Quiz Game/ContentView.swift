//
//  ContentView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var section = 0

    @StateObject var gameManager = GameManager()
//    @StateObject var gameManager = GameManager(difficulty: .hard)
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
                    destination: GameView()
                        .environmentObject(gameManager),
                    label: {
                        PrimaryButton(text: "Start")
                    })
                    .navigationBarHidden(true)
                
                Text("Выбранная сложность:\(section)")
                    .foregroundColor(Color("AccentColor"))
                
//                Picker(selection: $section,
//                       label: Text(""),
//                       content: {
//                        ForEach(difficultyArray, id: \.self, content: {
//                            Text($0)
//                                .foregroundColor(Color("AccentColor"))
//                        })
//                       }).frame(width: 100, height: 80)
                Picker(selection: $section,
                       label: Text("")) {
                    ForEach(0..<difficultyArray.count) {
                            Text(difficultyArray[$0])
                                .foregroundColor(Color("AccentColor"))
                        }
                       }.frame(width: 100, height: 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
