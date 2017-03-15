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
    
    @IBOutlet weak var lblVictoryText: UILabel!
    
    // MARK: - Properties
    
    var page: Page?

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let page = page {
            lblVictoryText.text = page.pageText
        }
    }
    
    // MARK: - Play Again
    
    @IBAction func playAgain(_ sender: Any) {
        // segue to title screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "titleView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

}
