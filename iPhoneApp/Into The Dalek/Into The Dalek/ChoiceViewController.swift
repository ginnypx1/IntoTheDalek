//
//  ChoiceViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class ChoiceViewController: UIViewController {
    
    @IBOutlet weak var lblChoiceText: UILabel!
    @IBOutlet weak var segYesNoOUTLET: UISegmentedControl!
    
    let choiceText = "  You are surrounded by soldiers with guns. The rebel officers have been waiting for you. They explain: They have captured a strange Dalek and they need your help.\n\n  This strange new Dalek appears to be... GOOD.\n\n  Will you help confirm the existence of a good Dalek?"
    
    // MARK: - Apple Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // load choice directions
        lblChoiceText.text = choiceText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Accept mission
    
    @IBAction func segAcceptOrDeclineACTION(_ sender: AnyObject) {
        switch segYesNoOUTLET.selectedSegmentIndex {
        case 0:
            deathNumber = 0
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 1:
            pageCount += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        default:
            break
        }
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
