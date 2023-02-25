//
//  QuestionView.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import SwiftUI

struct QuestionView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            HStack {
                Text("Qiuz Game")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("AccentColor"))
                
                Spacer()
                
                Text("1 from 10")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: 40)
            
            VStack(alignment: .leading, spacing: 20) {
                Text("What is the approximate value of mathematical constant e?")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("AccentColor"))
                
                AnswerRow(answer: Answer(text: "111", isCorrect: false))
                
                AnswerRow(answer: Answer(text: "222", isCorrect: true))
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
    }
}
