//
//  GameManager.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    private(set) var game: [Game.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var endGame = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question : NSAttributedString = NSAttributedString(string: "")
    @Published private(set) var answerChoices : [Answer] = []
    @Published private(set) var progress : CGFloat = 0
    @Published private(set) var score = 0
    
    init(difficulty: Difficulty) {
        fetchGame(with: difficulty)
    }
    
    func fetchGame(with difficulty: Difficulty) /* async */ {
        let urlString = "https://opentdb.com/api.php?amount=10&difficulty=\(difficulty)"
        guard let url = URL(string: urlString) else {fatalError("Missing URL")}
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { print("Error while fething data")
                return }
            guard data != nil else { print("No data"); return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decodedData = try decoder.decode(Game.self, from: data!)
                
                for item in decodedData.results {
                    self.game.append(item)
                    self.length = self.game.count
                    self.setQuestion()
                    print(self.length)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        } else {
            endGame = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat( Double(index + 1) / Double(length) * 350 ) // todo
        
        if index < length {
            let currentGameQuestion = game[index]
            question = currentGameQuestion.formattedQuestion
            answerChoices = currentGameQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        
        if answer.isCorrect {
            score += 1
            
        }
    }
}

public enum Difficulty: String {
    case hard
    case medium
    case easy
}
