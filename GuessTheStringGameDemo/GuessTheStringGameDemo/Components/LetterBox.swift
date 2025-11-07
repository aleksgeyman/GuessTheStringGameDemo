//
//  LetterBox.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import SwiftUI

struct LetterBox: View {
    enum State {
        case initial, match, contain, miss
        
        var color: Color {
            switch self {
            case .initial:
                    .white
            case .match:
                    .green
            case .contain:
                    .orange
            case .miss:
                    .red
            }
        }
    }
    @Binding var input: String
    @Binding var state: State
    
    var body: some View {
        TextField("", text: $input)
            .frame(maxWidth: 64, maxHeight: 64)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .keyboardType(.alphabet)
            .textInputAutocapitalization(.characters)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(state.color)
                    .stroke(.blue, lineWidth: 1)
            }
            .textInputModifier(input: $input)
    }
}

#Preview {
    HStack(spacing: 16) {
        LetterBox(input: .constant("A"), state: Binding.constant(.initial))
        LetterBox(input: .constant("A"), state: Binding.constant(.match))
        LetterBox(input: .constant("A"), state: Binding.constant(.contain))
        LetterBox(input: .constant("A"), state: Binding.constant(.miss))
    }
}
