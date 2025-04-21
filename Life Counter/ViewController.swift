//
//  ViewController.swift
//  Life Counter
//
//  Created by Anant Dhokia on 4/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    var playerOneHealth = 20
    var playerTwoHealth = 20

    @IBOutlet weak var playerOneHealthLabel: UILabel!
    @IBOutlet weak var playerTwoHealthLabel: UILabel!
    @IBOutlet weak var loserLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loserLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playerOnePlus1(_ sender: Any) {
        playerOneHealth += 1
        playerOneHealthLabel.text = "\(playerOneHealth)"
        if playerOneHealth > 0 {
            if playerTwoHealth <= 0 {
                loserLabel.text = "Player 2 LOSES!"
            } else {
                loserLabel.isHidden = true
            }
        }
    }
    
    @IBAction func playerOneMinus1(_ sender: Any) {
        playerOneHealth -= 1
        playerOneHealthLabel.text = "\(playerOneHealth)"
        if playerOneHealth <= 0 {
            loserLabel.text = "Player 1 LOSES!"
            loserLabel.isHidden = false
        }
    }
    
    @IBAction func playerOnePlus5(_ sender: Any) {
        playerOneHealth += 5
        playerOneHealthLabel.text = "\(playerOneHealth)"
        if playerOneHealth > 0 {
            if playerTwoHealth <= 0 {
                loserLabel.text = "Player 2 LOSES!"
            } else {
                loserLabel.isHidden = true
            }
        }
    }
    
    @IBAction func playerOneMinus5(_ sender: Any) {
        playerOneHealth -= 5
        playerOneHealthLabel.text = "\(playerOneHealth)"
        if playerOneHealth <= 0 {
            loserLabel.text = "Player 1 LOSES!"
            loserLabel.isHidden = false
        }
    }
    
    @IBAction func playerTwoPlus1(_ sender: Any) {
        playerTwoHealth += 1
        playerTwoHealthLabel.text = "\(playerTwoHealth)"
        if playerTwoHealth > 0 {
            if playerOneHealth <= 0 {
                loserLabel.text = "Player 1 LOSES!"
            } else {
                loserLabel.isHidden = true
            }
        }
    }
    @IBAction func playerTwoMinus1(_ sender: Any) {
        playerTwoHealth -= 1
        playerTwoHealthLabel.text = "\(playerTwoHealth)"
        if playerTwoHealth <= 0 {
            loserLabel.text = "Player 2 LOSES!"
            loserLabel.isHidden = false
        }
    }
    @IBAction func playerTwoPlus5(_ sender: Any) {
        playerTwoHealth += 5
        playerTwoHealthLabel.text = "\(playerTwoHealth)"
        if playerTwoHealth > 0 {
            if playerOneHealth <= 0 {
                loserLabel.text = "Player 1 LOSES!"
            } else {
                loserLabel.isHidden = true
            }
        }
    }
    @IBAction func playerTwoMinus5(_ sender: Any) {
        playerTwoHealth -= 5
        playerTwoHealthLabel.text = "\(playerTwoHealth)"
        if playerTwoHealth <= 0 {
            loserLabel.text = "Player 2 LOSES!"
            loserLabel.isHidden = false
        }
    }
}

