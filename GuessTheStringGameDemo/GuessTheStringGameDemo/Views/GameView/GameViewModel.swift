//
//  GameViewModel.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import Foundation

enum GameState: Equatable {
    case inTime
    case end(String)
}

@MainActor
final class GameViewModel: ObservableObject {
    @Published var userInput: [UserInput] = []
    @Published var remainingTime: Int = 0
    var gameState: GameState = .inTime
    var resultViewText: String {
        switch gameState {
        case .end(let title):
            title
        default:
            ""
        }
    }
    
    private var stringToGuess: String {
        didSet{
            print("String to guess:", stringToGuess)
        }
    }
    
    private var isComplete: Bool {
        userInput.map {$0.state}.allSatisfy {$0 == .match}
    }
    
    private var timer: Timer?
    
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
        startTimer()
        setGameState()
    }
    
    func restart() {
        stringToGuess = Utils.generateRandomString()
        start()
    }
    
    func checkPositions() {
        for index in 0..<userInput.count {
            userInput[index].setState(stringToGuess: stringToGuess)
        }
        
        setGameState()
    }
    
    private func startTimer() {
        remainingTime = Constants.GAME_TIME
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(
            withTimeInterval: 1,
            repeats: true,
            block: { [weak self] timer in
                Task { @MainActor in
                    self?.timerBlock(for: timer)
                }
            })
    }
    
    private func timerBlock(for timer: Timer) {
        decrementRemainingTime()
        if remainingTime == 0 {
            timer.invalidate()
            setGameState()
        }
    }
    
    private func decrementRemainingTime() {
        if remainingTime > 0 {
            remainingTime -= 1
        }
    }
    
    private func setGameState() {
        if isComplete {
            gameState = .end("Success")
        } else if remainingTime == 0 {
            gameState = .end("Game Over")
        } else {
            gameState = .inTime
        }
    }
}
