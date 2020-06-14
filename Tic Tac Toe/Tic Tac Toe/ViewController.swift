//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Tohid Fahim on 14/6/20.
//  Copyright © 2020 Tohid Fahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    var gameState = [3, 4, 5, 6, 7, 8, 9, 10, 11]
    var winngingPlayer : Int = 0
    var ct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        playAgainButton.isHidden = true
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        activePlayer = 1 //Cross
        gameState = [3, 4, 5, 6, 7, 8, 9, 10, 11]
        winngingPlayer = 0
        ct = 0
        
        for tag in 1...9 {
            let button = view.viewWithTag(tag) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        playAgainButton.isHidden = true
    }
    

    @IBAction func playerAction(_ sender: UIButton) {
        
        if (gameState[sender.tag-1] != 1 && gameState[sender.tag-1] != 2) {
            if activePlayer == 1{
                sender.setImage(UIImage(named: "Cross.jpeg"), for: UIControl.State())
                activePlayer = 2
                gameState[sender.tag-1] = 1
                ct += 1
            }
            else {
                sender.setImage(UIImage(named: "Zero.jpeg"), for: UIControl.State())
                activePlayer = 1
                gameState[sender.tag-1] = 2
                ct += 1
            }
        }
        
        
       if (gameState[0] == gameState [1] && gameState[1] == gameState[2]){
            winngingPlayer = gameState[0]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[3] == gameState [4] && gameState[4] == gameState[5]){
            winngingPlayer = gameState[3]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[6] == gameState [7] && gameState[7] == gameState[8]){
            winngingPlayer = gameState[6]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[0] == gameState [3] && gameState[3] == gameState[6]){
            winngingPlayer = gameState[0]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[1] == gameState [4] && gameState[4] == gameState[7]){
            winngingPlayer = gameState[1]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[2] == gameState [5] && gameState[5] == gameState[8]){
            winngingPlayer = gameState[2]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[0] == gameState [4] && gameState[4] == gameState[8]){
            winngingPlayer = gameState[0]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        else if (gameState[2] == gameState [4] && gameState[4] == gameState[6]){
            winngingPlayer = gameState[2]
            alertOfEndGame(winPlayer: winngingPlayer)
        }
        
        if ct == 9 {
            alertOfEndGame(winPlayer: winngingPlayer)
        }
    }
    
    func alertOfEndGame(winPlayer : Int){
        var alert : UIAlertController?
        
        if winPlayer == 0 {
            alert = UIAlertController(title: "TIC TAC TOE", message: "Match Drawn", preferredStyle: .alert)
        }
        else {
            alert = UIAlertController(title: "TIC TAC TOE", message: "Player \(winPlayer) Wins", preferredStyle: .alert)
        }
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert!.addAction(action)
        present(alert!, animated: true, completion: nil)
        
        playAgainButton.isHidden = false
    }

}


