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
            do {
                return NSAttributedString(string: question)
            } catch {
                print(error)
                return NSAttributedString(string: "")
            }
        }
    }
}
