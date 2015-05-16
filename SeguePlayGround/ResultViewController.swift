//
//  ResultViewController.swift
//  SeguePlayGround
//
//  Created by Oskar Hasinski on 15.05.15.
//  Copyright (c) 2015 Oskar Hasinski. All rights reserved.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var gameResults: Game!
    var m1 = PlayersMove.Paper
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelGemuResult: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(self.gameResults.winner == 0) {
            labelGemuResult.text = "It's a tie!"
        } else if(self.gameResults.winner == 1) {
            labelGemuResult.text = "You win!"
        } else  {
            labelGemuResult.text = "You loose!"
        }
        
        image.image = getImage()
    }
    
    func getImage() -> UIImage {
        let p1 = self.gameResults.player1
        let p2 = self.gameResults.player2
        
        let glue: String
        let paper = PlayersMove.Paper
        let rock = PlayersMove.Rock
        let scissors = PlayersMove.Scissors
        let imageName: String
        
        let name1: PlayersMove
        let name2: PlayersMove
        
        if(self.gameResults.winner == 0) {
            imageName = "itsATie"
        } else {
            
            if(self.gameResults.winner == 1) {
                name1 = p1.myMove
                name2 = p2.myMove
                
            } else {
                name1 = p2.myMove
                name2 = p1.myMove
            }
            
            switch(name1)
            {
            case paper:
                glue = "Covers"
            case rock:
                glue = "Crushes"
            default:
                glue = "Cut"
            }
            imageName = "\(name1)\(glue)\(name2)"
        }
        
        return UIImage(named: imageName)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // dismiss this view controller
    @IBAction func playAgain() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}