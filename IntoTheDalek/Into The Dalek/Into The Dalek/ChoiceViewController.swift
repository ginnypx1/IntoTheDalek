//
//  ChoiceViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var choiceText: UILabel!
    @IBOutlet weak var yesOrNo: UISegmentedControl!
    
    // MARK: - Properties
    
    var page: Page!
    
    // MARK: - Apple Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        choiceText.text = page.pageText
    }
    
    // MARK: - Accept or decline mission
    
    @IBAction func acceptOrDecline(_ sender: UIButton) {
        
        switch yesOrNo.selectedSegmentIndex {
        case 0: // decline mission
            page.deathNumber = 0
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            nextViewController.page = page
            navigationController?.pushViewController(nextViewController, animated: true)
        case 1: // accept mission
            page.pageNumber += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            nextViewController.page = page
            navigationController?.pushViewController(nextViewController, animated: true)
        default: break
        }
    }

}
