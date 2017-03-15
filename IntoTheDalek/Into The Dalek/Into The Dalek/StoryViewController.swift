//
//  StoryViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class StoryViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var lblTextView: UILabel!
    
    // MARK: - Properties
    
    var page = Page()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTextView.text = page.pageText
    }
    
    // MARK: - Navigation
    
    @IBAction func nextPageACTION(_ sender: AnyObject) {
        // turn page by increasing page number by 1
        page.pageNumber += 1
        
        // load the next page
        switch page.pageType {
        case .choiceView:
            // transition to choice/ choiceView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "choiceView") as! ChoiceViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .riddleView:
            // transition to riddle/ riddleView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "riddleView") as! RiddleViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .codeView:
            // transition to crack code/ codeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "codeView") as! CodeViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .rpssView:
            // transition to RpssView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "rpssView") as! RoshamboViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .laserView:
            // transition to laserView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "laserView") as! LaserViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .jokeView:
            // transition to jokeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "jokeView") as! JokeViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .victoryView:
            // transition to victoryView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "victoryView") as! VictoryViewController
            nextViewController.page = self.page
            self.present(nextViewController, animated:true, completion:nil)
        case .storyView:
            // refresh the text
            lblTextView.text = page.pageText
        }
    }

}
