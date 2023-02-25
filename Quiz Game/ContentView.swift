//
//  ContentView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager(difficulty: .hard) // todo
    
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
                    destination: GameView(),
                    label: {
                        PrimaryButton(text: "Start")
                    })
                    .navigationBarHidden(true)
                    
             
                
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
