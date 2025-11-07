//
//  UserInput.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import Foundation

struct UserInput: Identifiable {
    let id = UUID()
    let position: Int
    var input: String
    var state: LetterBox.State
    
    init(position: Int, state: LetterBox.State) {
        self.input = ""
        self.position = position
        self.state = state
    }
    
    mutating func setState(stringToGuess: String) {
        if input == stringToGuess[position] {
            state = .match
        } else if stringToGuess.contains(input) {
            state = .contain
        } else if input.isEmpty {
            state = .initial
        } else {
            state = .miss
        }
    }
}
