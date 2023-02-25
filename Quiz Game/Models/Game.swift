//
//  Game.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import Foundation

struct Game: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: NSAttributedString {
            NSAttributedString(string: question)
        }
        
        var answers: [Answer] {
                let correct = [Answer(text: NSAttributedString(string: correctAnswer), isCorrect: true)]
                let incorrects = incorrectAnswers.map {
                    Answer(text: NSAttributedString(string: $0), isCorrect: false)
                }
                return (correct + incorrects).shuffled()
        }
    }
}
