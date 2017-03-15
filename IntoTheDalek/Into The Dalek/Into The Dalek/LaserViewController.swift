//
//  LaserViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/19/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class LaserViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet var laserLabels: [UILabel]!
    
    // MARK: - Properties
    
    var page: Page?
    var shotCount: Int = -1
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // reset shot count
        shotCount = -1
    }
    
    // MARK: - Shoot Laser
    
    func displayLoad() {
        var shot = 0
        while shot <= shotCount {
            if shot < 4 {
                laserLabels[shot].backgroundColor = UIColor.yellow
                shot += 1
            } else if (shot >= 4) && (shot < 8) {
                laserLabels[shot].backgroundColor = UIColor.orange
                shot += 1
            } else if (shot >= 8) && (shot < 12) {
                laserLabels[shot].backgroundColor = UIColor.red
                shot += 1
            } else if (shot >= 12) {
                laserLabels[shot].backgroundColor = UIColor.brown
                shot += 1
            }
        }
    }

    @IBAction func loadLaser(_ sender: Any) {
        shotCount += 1
        displayLoad()
    }
    
    // MARK: - Display Results
    
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
    
    // MARK: - Determine results
    
    @IBAction func shootLaser(_ sender: Any) {
        guard self.page != nil else {
            return
        }
        
        if (shotCount < 8) {
            // die
            self.die(deathNumber: 4)
        } else if (shotCount >= 12) {
            // die
            self.die(deathNumber: 5)
        } else {
            // continue story
            self.continueStory()
        }
    }
    
}
