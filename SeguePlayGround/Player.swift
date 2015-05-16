//
//  Player.swift
//  SeguePlayGround
//
//  Created by Oskar Hasinski on 15.05.15.
//  Copyright (c) 2015 Oskar Hasinski. All rights reserved.
//

import Foundation

// define player moves
enum PlayersMove {
    case Rock, Paper, Scissors
    
    // initializie startup value
    init() {
        let rand = Int(arc4random() % 3)
        
        switch(rand) {
        case 0:
            self = .Rock
            
        case 1:
            self = .Paper
            
        default:
            self = .Scissors
        }
    }
}

extension PlayersMove: Printable {
    
    var description: String {
        get {
            switch (self) {
                
            case .Rock:
                return "Rock"
                
            case .Paper:
                return "Paper"
                
            case .Scissors:
                return "Scissors"
                
            }
        }
    }
}


class Player {
    // my move
    var myMove: PlayersMove!
    
    // make the CPUs move
    func generateRandomMove() {
        makeMove(PlayersMove())
    }
    
    // make the move
    func makeMove(move: PlayersMove) {
        self.myMove = move
    }
    
}