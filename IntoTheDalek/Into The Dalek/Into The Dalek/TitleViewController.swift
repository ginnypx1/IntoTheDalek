//
//  TitleViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccessibilityManager.applyDynamicText(to: startButton)
    }
    
    // MARK: - Start Game

    @IBAction func startGame(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
 
}

