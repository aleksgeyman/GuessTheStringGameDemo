//
//  TextInputModifier.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import SwiftUI

struct TextInputModifier: ViewModifier {
    @Binding var input: String
    let length: Int
    
    func body(content: Content) -> some View {
        content
            .onChange(of: $input.wrappedValue) { _, newValue in
                input = String(newValue.prefix(length)).uppercased()
            }
    }
}

extension View {
    func textInputModifier(input: Binding<String>, length: Int = 1) -> some View {
        self.modifier(TextInputModifier(input: input, length: length))
    }
}
