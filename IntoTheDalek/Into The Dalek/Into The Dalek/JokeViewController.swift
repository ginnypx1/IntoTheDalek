//
//  JokeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    
    @IBOutlet weak var crossRoadJokeButton: UIButton!
    @IBOutlet weak var skinJokeButton: UIButton!
    @IBOutlet weak var appleJokeButton: UIButton!
    
    // MARK: - Properties
    
    var page: Page!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyAccessibility()
    }
    
    // MARK: - Continue Story
    
    func continueStory() {
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func die(deathNumber: Int) {
        guard var page = self.page else {
            return
        }
        page.deathNumber = deathNumber
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Tell Jokes
    
    @IBAction func tellAppleJoke(_ sender: Any) {
        die(deathNumber: 6)
    }
    
    @IBAction func tellSkinCareJoke(_ sender: Any) {
        die(deathNumber: 7)
    }
    
    @IBAction func tellRoadJoke(_ sender: Any) {
        continueStory()
    }
}
