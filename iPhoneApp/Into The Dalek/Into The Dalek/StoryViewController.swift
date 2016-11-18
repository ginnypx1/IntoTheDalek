//
//  StoryViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var lblTextView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load story[pageCount] as lblTextView.text
        lblTextView.text = story[pageCount]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextPageACTION(_ sender: AnyObject) {
        print(pageCount)
        switch pageCount {
        case 0:
            // transition to choice/ choiceView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "choiceView") as! ChoiceViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 1:
            // transition to riddle/ riddleView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "riddleView") as! RiddleViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 3:
            // transition to crack code/ codeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "codeView") as! CodeViewController
            self.present(nextViewController, animated:true, completion:nil)
        case (story.count-1):
            // segue to play again screen
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        default:
            // increase the page count
            pageCount += 1
            // refresh the text
            lblTextView.text = story[pageCount]
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
