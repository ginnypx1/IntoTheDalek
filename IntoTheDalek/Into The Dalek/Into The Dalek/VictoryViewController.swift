//
//  VictoryViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class VictoryViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var victoryText: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: - Properties
    
    var page: Page!

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        victoryText.text = page.pageText
        applyAccessibility()
    }
    
    // MARK: - Play Again
    
    @IBAction func playAgain(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
