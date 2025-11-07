//
//  GameViewModel.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import Foundation

@MainActor
final class GameViewModel: ObservableObject {
    @Published var userInput: [UserInput] = []
    private var stringToGuess: String {
        didSet{
            print("String to guess:", stringToGuess)
        }
    }
    
    private var isComplete: Bool {
        userInput.map {$0.state}.allSatisfy {$0 == .match}
    }
    
    init(with stringToGuess: String) {
        self.stringToGuess = stringToGuess
        print("String to guess:", stringToGuess)
        start()
    }
    
    func start() {
        var lettersToGuess = [UserInput]()
        for index in 0..<stringToGuess.count {
            lettersToGuess.append(UserInput(position: index, state: .initial))
        }
        
        self.userInput = lettersToGuess
    }
    
    func checkPositions() {
        for index in 0..<userInput.count {
            userInput[index].setState(stringToGuess: stringToGuess)
        }
    }
}
