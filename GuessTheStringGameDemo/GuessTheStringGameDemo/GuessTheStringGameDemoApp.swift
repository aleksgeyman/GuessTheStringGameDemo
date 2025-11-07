//
//  GuessTheStringGameDemoApp.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 7.11.25.
//

import SwiftUI

@main
struct GuessTheStringGameDemoApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: .init(with: Utils.generateRandomString()))
        }
    }
}
