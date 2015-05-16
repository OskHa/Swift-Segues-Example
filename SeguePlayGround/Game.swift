//
//  Game.swift
//  SeguePlayGround
//
//  Created by Oskar Hasinski on 15.05.15.
//  Copyright (c) 2015 Oskar Hasinski. All rights reserved.
//

import Foundation

class Game {
    
    var player1: Player!
    var player2: Player!
    var winner: Int
    
    var opt1 = PlayersMove.Paper
    var opt2 = PlayersMove.Rock
    var opt3 = PlayersMove.Scissors
    
    init(p1: Player, p2: Player) {
        self.player1 = p1
        self.player2 = p2
        
        // pre define the winner
        winner = 0
        
        match()
    }
    
    func match() {
        
        if(player1.myMove != player2.myMove) {
            switch(player1.myMove,player2.myMove)
            {
            case (opt1, opt2), (opt2, opt3), (opt3, opt1):
                
                // user wins
                winner = 1
                
            default:
                // cpu wins
                winner = 2
                
            }
        }
    }
    
    // return winning player
    func getWinner() -> Player? {
        switch(winner) {
        case 1:
            return player1
        case 2:
            return player2
        default:
            return nil
        }
    }
    
    // return loosing player
    func getLooser() -> Player? {
        switch(winner) {
        case 1:
            return player2
        case 2:
            return player1
        default:
            return nil
        }
    }
}