//
//  JokeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class JokeViewController: UIViewController {
    
    // MARK: - Properties
    
    var page: Page?
    
    // MARK: - Continue Story
    
    func continueStory() {
        guard var page = self.page else {
            return
        }
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func die(deathNumber: Int) {
        guard var page = self.page else {
            return
        }
        page.deathNumber = deathNumber
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    // MARK: - Tell Jokes
    
    @IBAction func tellAppleJoke(_ sender: Any) {
        guard self.page != nil else {
            return
        }
        die(deathNumber: 6)
    }
    
    @IBAction func tellSkinCareJoke(_ sender: Any) {
        guard self.page != nil else {
            return
        }
        die(deathNumber: 7)
    }
    
    @IBAction func tellRoadJoke(_ sender: Any) {
        guard self.page != nil else {
            return
        }
        continueStory()
    }
}
