//
//  MatchViewController.swift
//  SeguePlayGround
//
//  Created by Oskar Hasinski on 15.05.15.
//  Copyright (c) 2015 Oskar Hasinski. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {

    @IBOutlet weak var buttonRock: UIButton!
    @IBOutlet weak var buttonPaper: UIButton!
    @IBOutlet weak var buttonScissors: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var match: Game!
    
    @IBAction func theMove(sender: UIButton) {
        
        switch(sender) {
        case self.buttonRock:
            makeMove(PlayersMove.Rock)
            println("rock")
            
        case self.buttonPaper:
            makeMove(PlayersMove.Paper)
            println("paper")
            
        case self.buttonScissors:
            makeMove(PlayersMove.Scissors)
            println("scissors")
            
        default:
            println("error")
        }
    }
    
    func makeMove(move: PlayersMove) {
        // players move
        let player1 = Player()
        player1.makeMove(move)
        
        // generate CPUs move
        let player2 = Player()
        player2.makeMove(move)
        player2.generateRandomMove()
        
        // match the move
        self.match = Game(p1: player1, p2: player2)
        
        switch(move) {
            
        // programmatic VC presentation
        case PlayersMove.Rock:
            var controller: ResultViewController
            
            // get the storyboard and prepare the controller
            controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultView") as! ResultViewController
            
            // Communicate the match
            controller.gameResults = self.match
            
            // display view controller
            self.presentViewController(controller, animated: true, completion: nil)

            println("Code only")
            
        // programmatic + Segue VC presentation
        case PlayersMove.Paper:
            performSegueWithIdentifier("seguePaper", sender: self)
            println("Segue + code")
            
        // Segue only (prepareForSegue)
        default:
            println("Segue only")
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as! ResultViewController
        controller.gameResults = self.match
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
