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

    override func viewDidLoad() {
        super.viewDidLoad()

        // load riddle directions
        lblRiddleText.text = riddleText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func solveRiddleACTION(_ sender: AnyObject) {
        // if txtInputRiddle contains "other", increase pageCount, segue to story[2]
        // else, segue to deathView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
