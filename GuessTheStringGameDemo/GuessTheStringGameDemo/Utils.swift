//
//  Utils.swift
//  GuessTheStringGameDemo
//
//  Created by Aleksandar Geyman on 7.11.25.
//

import Foundation

struct Utils {
    
    static func generateRandomString(
        from stringPool: String = Constants.STRING_POOL,
        length: Int = Constants.RANDOM_STRING_LENGTH
    ) -> String {
        String(stringPool.shuffled().prefix(length))
    }
}
