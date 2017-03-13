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
    
    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load story[pageCount] as lblTextView.text
        lblTextView.text = story[pageCount]
    }
    
    // MARK: - Navigation
    
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
        case 5:
            // transition to RpssView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "rpssView") as! RoshamboViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 7:
            // transition to laserView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "laserView") as! LaserViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 10:
            // transition to jokeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "jokeView") as! JokeViewController
            self.present(nextViewController, animated:true, completion:nil)
        case 12:
            // transition to victoryView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "victoryView") as! VictoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        default:
            // increase the page count
            pageCount += 1
            // refresh the text
            lblTextView.text = story[pageCount]
        }
    }

}
