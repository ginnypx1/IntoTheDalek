//
//  DeathViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/28/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class DeathViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lossText: UILabel!
    @IBOutlet weak var deathQuip: UILabel!
    @IBOutlet weak var deathText: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: - Properties
    
    var page: Page!

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lossText.text = page.endText
        deathQuip.text = page.deathQuip
        deathText.text = page.deathText
        applyAccessibility()
    }
    
    // MARK: - Restart Game
    
    @IBAction func playAgain(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}
