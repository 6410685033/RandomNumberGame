//
//  Game.swift
//  RandomNumberGame
//
//  Created by Thammasat Thonggamgaew on 19/1/2567 BE.
//

import Foundation

struct Game {
    var target = Double.random(in: 0...1)
    var round = 0
    var win = false
    var msg = ""
    
    // "mutating" use to inform that func edit field
    mutating func check(guess: Double) {
        let guessNum = lround(guess*100)
        let check = lround(target*100)
        round += 1
        
        if guessNum == check {
            msg = "Correct! \n You make it in \(round) round"
            win = true
        } else if guessNum < check {
            msg = "Higher!"
        } else {
            msg = "Lower!"
        }
    return
    }
    
    mutating func startNewGame() {
        round = 0
        target = Double.random(in: 0...1)
        win = false
    }
    
    static func value(num: Double) -> Int{
        return lround(num*100)
    }

}
