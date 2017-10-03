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
    
    @IBOutlet weak var loadButton: UIButton!
    @IBOutlet weak var shootButton: UIButton!
    
    // MARK: - Properties
    
    var page: Page!
    var shotCount: Int = -1
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AccessibilityManager.applyDynamicText(to: loadButton)
        AccessibilityManager.applyDynamicText(to: shootButton)
        
        // reset shot count
        shotCount = -1
    }
    
    // MARK: - Shoot Laser
    
    func displayLoad() {
        var shot = 0
        while shot <= shotCount {
            if shot < 4 {
                laserLabels[shot].backgroundColor = .yellow
                laserLabels[shot].accessibilityLabel = "Yellow"
                shot += 1
            } else if (shot >= 4) && (shot < 8) {
                laserLabels[shot].backgroundColor = .orange
                laserLabels[shot].accessibilityLabel = "Orange"
                shot += 1
            } else if (shot >= 8) && (shot < 12) {
                laserLabels[shot].backgroundColor = .red
                laserLabels[shot].accessibilityLabel = "Red"
                shot += 1
            } else if (shot >= 12) {
                laserLabels[shot].backgroundColor = .brown
                laserLabels[shot].accessibilityLabel = "Brown"
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
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func die(deathNumber: Int) {
        page.deathNumber = deathNumber
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: - Determine results
    
    @IBAction func shootLaser(_ sender: Any) {
        if (shotCount < 8) {
            self.die(deathNumber: 4)
        } else if (shotCount >= 12) {
            self.die(deathNumber: 5)
        } else {
            self.continueStory()
        }
    }
    
}
