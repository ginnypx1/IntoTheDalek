//
//  JokeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class JokeViewController: UIViewController {
    
    // MARK: - Tell Jokes
    
    @IBAction func tellAppleJoke(_ sender: Any) {
        // transition to deathNumber 6
        deathNumber = 6
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func tellSkinCareJoke(_ sender: Any) {
        // transition to deathNumber 7
        deathNumber = 7
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func tellRoadJoke(_ sender: Any) {
        // transition to next story
        pageCount += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
}
