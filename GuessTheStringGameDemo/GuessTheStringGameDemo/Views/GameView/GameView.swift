//
//  GameView.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel: GameViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            timerView
            letterBoxesView
            buttonView
        }
        .padding()
    }
    
    private var timerView: some View {
        
    }
    
    private var letterBoxesView: some View {
        
    }
    
    private var buttonView: some View {
        
    }
}
