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
    
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    
    var page = Page()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.text = page.pageText
        applyAccessibility()
    }
    
    // MARK: - Navigation
    
    @IBAction func turnPage(_ sender: UIButton) {
        page.pageNumber += 1
        
        switch page.pageType {
        case .choiceView:
            // transition to choice/ choiceView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "choiceView") as! ChoiceViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .riddleView:
            // transition to riddle/ riddleView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "riddleView") as! RiddleViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .codeView:
            // transition to crack code/ codeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "codeView") as! CodeViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .rpssView:
            // transition to RpssView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "rpssView") as! RoshamboViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .laserView:
            // transition to laserView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "laserView") as! LaserViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .jokeView:
            // transition to jokeView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "jokeView") as! JokeViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .victoryView:
            // transition to victoryView
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "victoryView") as! VictoryViewController
            nextViewController.page = self.page
            navigationController?.pushViewController(nextViewController, animated: true)
        case .storyView:
            // refresh the text
            let pageText = page.pageText
            textView.text = pageText
            textView.accessibilityLabel = pageText
        }
    }

}
