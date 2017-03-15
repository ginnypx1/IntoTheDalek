//
//  StartViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class StartViewController: UIViewController {
    
    // MARK: - Properties
    
    var page: Page?
    let storyViewController = StoryViewController()
    
    // MARK: - Start Game
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize story
        let story = Story()
        page = Page(story: story)
    }

    @IBAction func startGameACTION(_ sender: AnyObject) {
        // when button pressed, start story
        if var page = page {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewcontroller = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            
            nextViewcontroller.page = page
            page.pageNumber += 1
            
            self.present(nextViewcontroller, animated:true, completion:nil)
        }
        
    }

}

