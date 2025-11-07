//
//  GameView.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel: GameViewModel
    @State private var shouldShowResultScreen: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            timerView
            letterBoxesView
            buttonView
        }
        .padding()
        .onChange(of: viewModel.gameState) { _, newValue in
            if case .end = newValue {
                shouldShowResultScreen = true
            }
        }
        .fullScreenCover(isPresented: $shouldShowResultScreen) {
            ResultView(text: viewModel.resultViewText) {
                viewModel.restart()
            }
        }
    }
    
    private var timerView: some View {
        Text("\(viewModel.remainingTime) seconds remaining")
    }
    
    private var letterBoxesView: some View {
        HStack(spacing: 8) {
            ForEach($viewModel.userInput) { userInput in
                LetterBox(input: userInput.input, state: userInput.state.wrappedValue)
            }
        }
    }
    
    private var buttonView: some View {
        Button("Check") {
            viewModel.checkPositions()
        }
        .buttonStyle(.borderedProminent)
    }
}
