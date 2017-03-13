//
//  VictoryViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class VictoryViewController: UIViewController {
    
    @IBOutlet weak var lblVictoryText: UILabel!
    
    let victoryText = "  The good Dalek sends a signal to his mothership. He tells the rest of the Dalek force: 'The 'Aristotle' has been destroyed.' The rebels can now operate completely under the Dalek radar.\n\n  You leave them with a new soldier -- the good Dalek.\n\n  You hop on the Tardis and turn the key.\n\n  A new adventure awaits..."

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblVictoryText.text = victoryText
    }
    
    // MARK: - Play Again
    
    @IBAction func playAgain(_ sender: Any) {
        // reset all variables
        isDead = false
        pageCount = 0
        // segue to title screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "titleView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

}
