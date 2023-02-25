//
//  GameManager.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import Foundation

class GameManager: ObservableObject {
    
    var difficulty: String
    
    init(difficulty: String) {
        self.difficulty = difficulty
    }
    
    func fetchGame(with difficulty: String) /* async */ {
        let urlString = "https://opentdb.com/api.php?amount=10&difficulty=\(difficulty)"
        
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            try URLSessionTask
        } catch <#pattern#> {
            <#statements#>
        }
        
    }
}
