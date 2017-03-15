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
    
    @IBOutlet weak var lblChoiceText: UILabel!
    @IBOutlet weak var segYesNoOUTLET: UISegmentedControl!
    
    // MARK: - Properties
    
    var page: Page?
    
    // MARK: - Apple Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // load choice directions
        if let page = page {
            lblChoiceText.text = page.pageText
        }
    }
    
    // MARK: - Accept or decline mission
    
    @IBAction func segAcceptOrDeclineACTION(_ sender: AnyObject) {
        guard var page = self.page else {
            return
        }
        
        switch segYesNoOUTLET.selectedSegmentIndex {
        case 0: // decline mission
            page.deathNumber = 0
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            nextViewController.page = page
            self.present(nextViewController, animated:true, completion:nil)
        case 1: // accept mission
            page.pageNumber += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            nextViewController.page = page
            self.present(nextViewController, animated:true, completion:nil)
        default: break
        }
    }

}
