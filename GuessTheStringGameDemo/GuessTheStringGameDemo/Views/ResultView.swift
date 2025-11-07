//
//  ResultView.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    let text: String
    let onAction: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
            Text(text)
            Button("Retry") {
                onAction()
                dismiss()
            }
            Spacer()
        }
    }
}
