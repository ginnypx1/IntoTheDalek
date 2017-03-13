//
//  RiddleViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class RiddleViewController: UIViewController {
    
    @IBOutlet weak var lblRiddleText: UILabel!
    @IBOutlet weak var txtInputRiddle: UITextField!
    
    let riddleText = "Remember:\n\nOne Dalek lies.\n\nThe other tells the truth.\n\nYou decide to ask the Dalek on the left:"

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load riddle directions
        lblRiddleText.text = riddleText
    }
    
    // MARK: - Solve Riddle
    
    @IBAction func solveRiddleACTION(_ sender: AnyObject) {
        if (!(txtInputRiddle.text?.isEmpty)!) {
            // if txtInputRiddle contains "other", increase pageCount, segue to story[2]
            if (txtInputRiddle.text?.localizedStandardContains("other") == true) {
                pageCount += 1
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
                self.present(nextViewController, animated:true, completion:nil)
            } else {
                deathNumber = 1
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
        } // TODO: alert if text in textfield is invalid
    }

}
