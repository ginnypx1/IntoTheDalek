//
//  DeathViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/28/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


var isDead = false
var deathNumber: Int = 0


class DeathViewController: UIViewController {
    
    @IBOutlet weak var lblLossText: UILabel!
    @IBOutlet weak var lbldeathQuip: UILabel!
    @IBOutlet weak var lblDeathText: UILabel!
    
    let deathQuips: [String] = [
        "YOU ARE AN ENEMY OF THE DALEKS! YOU MUST BE DESTROYED!!",
        "Attack and Destroy!",
        "You are the Doctor! You are the enemy of the Daleks! You are dead!",
        "Exterminate!",
        "Only one race can survive!",
        "You will be exterminated!",
        "Your forces will be exterminated! Annihilate!\n\nEXTERMINATE!",
        "All enemies of the Daleks must be destroyed!\n\nExterminate!",
        "Seek! Locate! Exterminate!",
        "Nothing must interfere with the true destiny of the Daleks!!\n\nYou must be exterminated! Exterminated! EXTERMINATED!!",
    ]
    
    let deathText = // tag on all the deaths
    "Extermination Successful.\n\nThe human race is dead.\n\nCare to rewind the tardis and try it all again?"

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // generate a random quip
        let randomNumber:UInt32 = arc4random_uniform(UInt32(deathQuips.count))
        // load the text
        lblLossText.text = lossText[deathNumber]
        lbldeathQuip.text = deathQuips[Int(randomNumber)]
        lblDeathText.text = deathText
    }
    
    // MARK: - Restart Game
    
    @IBAction func playAgainACTION(_ sender: AnyObject) {
        // reset all variables
        isDead = false
        pageCount = 0
        // segue to title screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "titleView") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

}
