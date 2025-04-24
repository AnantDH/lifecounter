//
//  HistoryViewController.swift
//  Life Counter
//
//  Created by Anant Dhokia on 4/23/25.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var historyLabel: UILabel!
    
    var history: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        var historyString: String = "Game History\n"
        for historyItem in history {
            historyString += "\(historyItem)\n"
        }
        historyLabel.text = historyString
    }

}
