//
//  ViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Start Game

    @IBAction func startGameACTION(_ sender: AnyObject) {
        // segue to story title
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        self.present(nextViewController, animated:true, completion:nil)
    }

    
}

