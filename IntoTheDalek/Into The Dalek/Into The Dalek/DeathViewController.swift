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
    
    @IBOutlet weak var lblLossText: UILabel!
    @IBOutlet weak var lbldeathQuip: UILabel!
    @IBOutlet weak var lblDeathText: UILabel!
    
    // MARK: - Properties
    
    var page: Page?

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the text
        if let page = page {
            lblLossText.text = page.endText
            lbldeathQuip.text = page.deathQuip
            lblDeathText.text = page.deathText
        }
    }
    
    // MARK: - Restart Game
    
    @IBAction func playAgainACTION(_ sender: AnyObject) {
        // reload title screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "titleView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

}
