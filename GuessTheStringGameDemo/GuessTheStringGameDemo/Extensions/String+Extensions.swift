//
//  String+Extensions.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 8.11.25.
//

import Foundation

extension String {
    subscript(index: Int) -> String {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return String(self[charIndex])
    }
}
