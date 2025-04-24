//
//  ViewController.swift
//  Life Counter
//
//  Created by Anant Dhokia on 4/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    var numPlayers = 0
    
    var xPos = 110
    var yPos = 300
    var customButtons: [UIButton] = []
    var playersHealth: [Int] = []
    var playersHealthLabels: [UILabel] = []
    var customIncramenter = 5
    @IBOutlet weak var addPlayerButton: UIButton!
    @IBOutlet weak var customIncramenterVal: UITextField!
    var gameHistory: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // create initial 4 players
        for _ in 0..<4 {
            createPlayer()
        }
    }
    
    func createPlayer() {
        numPlayers += 1
        if xPos == 860 {
            yPos += 175
            xPos = 110
        }
        createLabel(xPos: xPos, yPos: yPos)
        let index = createPlayerHealthLabel(xPos: xPos + 30, yPos: yPos)
        customButtons.append(createButton(xPos: xPos + 70, yPos: yPos + 100, isPositive: true, index: index))
        customButtons.append(createButton(xPos: xPos - 10, yPos: yPos + 100, isPositive: false, index: index))
        xPos += 250
    }
    
    func createLabel(xPos: Int, yPos: Int) {
        let newLabel = UILabel(frame: CGRect(x: xPos, y: yPos, width: 150, height: 150))
        newLabel.text = "Player \(numPlayers)"
        newLabel.textColor = .white
        newLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.view.addSubview(newLabel)
    }
    
    func createPlayerHealthLabel(xPos: Int, yPos: Int) -> Int {
        let newLabel = UILabel(frame: CGRect(x: xPos, y: yPos, width: 60, height: 50))
        newLabel.text = "20"
        newLabel.textColor = .white
        newLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.view.addSubview(newLabel)
        playersHealth.append(20)
        let index = playersHealthLabels.count
        playersHealthLabels.append(newLabel)
        return index
    }
    
    func createButton(xPos: Int, yPos: Int, isPositive: Bool, index: Int) -> UIButton {
        let newButton = UIButton(type: .roundedRect)
        newButton.frame = CGRect(x: xPos, y: yPos, width: 50, height: 50)
        newButton.backgroundColor = .darkGray
        if isPositive {
            newButton.setTitle("+\(customIncramenter)", for: .normal)
        } else {
            newButton.setTitle("-\(customIncramenter)", for: .normal)
        }
        
        newButton.addTarget(self, action: #selector(handleHealthButton(_:)), for: .touchUpInside)
        newButton.tag = index
        self.view.addSubview(newButton)
        return newButton
    }
    
    @IBAction func handleNewIncramenter(_ sender: Any) {
        if let text = customIncramenterVal.text {
            if let newNum = Int(text) {
                customIncramenter = newNum
                for button in customButtons {
                    if let buttonTitle = button.title(for: .normal) {
                        if buttonTitle.contains("+") {
                            button.setTitle("+\(newNum)", for: .normal)
                        } else {
                            button.setTitle("-\(newNum)", for: .normal)
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func handleAddPlayer(_ sender: Any) {
        if numPlayers < 8 {
            createPlayer()
        }
    }
    
    @objc func handleHealthButton(_ sender: UIButton) {
        addPlayerButton.isHidden = true
        if let buttonTitle = sender.title(for: .normal) {
            var currHealth = playersHealth[sender.tag]
            if buttonTitle.contains("+") {
                currHealth += customIncramenter
                playersHealth[sender.tag] = currHealth
                gameHistory.append("Player \(sender.tag + 1) gained \(customIncramenter) life")
            } else {
                currHealth -= customIncramenter
                playersHealth[sender.tag] = currHealth
                gameHistory.append("Player \(sender.tag + 1) lost \(customIncramenter) life")
            }
            playersHealthLabels[sender.tag].text = "\(currHealth)"
            
            if currHealth <= 0 {
                playersHealthLabels[sender.tag].textColor = .red
            } else {
                playersHealthLabels[sender.tag].textColor = .white
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory",
           let destination = segue.destination as? HistoryViewController {
            destination.history = gameHistory
        }
    }
}
