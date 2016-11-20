//
//  LaserViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/19/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class LaserViewController: UIViewController {

    @IBOutlet var laserLabels: [UILabel]!
    
    var shotCount: Int = -1
    
    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shotCount = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    @IBAction func shootLaser(_ sender: Any) {
        if (shotCount < 8) {
            // transition to death, deathNumber 4
            deathNumber = 4
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else if (shotCount >= 12) {
            // transition to death, deathNumber 5
            deathNumber = 5
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else {
            // transition to story
            pageCount += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
}
