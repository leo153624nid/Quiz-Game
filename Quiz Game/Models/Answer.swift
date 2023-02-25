//
//  Answer.swift
//  Quiz Game
//
//  Created by macbook on 25.02.2023.
//

import Foundation
import SwiftUI

struct Answer: Identifiable {
    var id = UUID()
    var text: NSAttributedString
//    var text: String
    var isCorrect: Bool
}
