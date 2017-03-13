//
//  RoshamboViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/12/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {

    @IBOutlet weak var lblResults: UILabel!
    
    var choices: [String] = ["rock", "paper", "sonic screwdriver"]
    
    var doctorHand: String?
    var playerHand: String?
    
    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblResults.text = "'Rock, Paper, Scissors?' you ask.\n\n  'Of course not! Rock, Paper, Sonic Screwdriver.'"
    }
    
    // MARK: - RPSS Game Functions
    
    func chooseDoctorHand() {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        doctorHand = choices[randomNumber]
    }
    
    func displayDraw() {
        lblResults.text = "It's a draw!\nChoose again."
    }
    
    @IBAction func chooseRock(_ sender: Any) {
        chooseDoctorHand()
        playerHand = choices[0]
        
        if (doctorHand == "sonic screwdriver") {
            // you win, transition to death
            deathNumber = 3
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else if (doctorHand == "paper") {
            // you lose, pageCount += 1, transition to story[6]
            pageCount += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else {
            displayDraw()
        }
    }
    
    @IBAction func choosePaper(_ sender: Any) {
        chooseDoctorHand()
        playerHand = choices[1]
        
        if (doctorHand == "rock") {
            // you win, transition to death
            deathNumber = 3
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else if (doctorHand == "sonic screwdriver") {
            // you lose, pageCount += 1, transition to story[6]
            pageCount += 1
            pageCount += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else {
            displayDraw()
        }
    }
    
    @IBAction func chooseSonicScrewdriver(_ sender: Any) {
        chooseDoctorHand()
        playerHand = choices[2]
        
        if (doctorHand == "paper") {
            // you win, transition to death
            deathNumber = 3
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else if (doctorHand == "rock") {
            // you lose, pageCount += 1, transition to story[6]
            pageCount += 1
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
            self.present(nextViewController, animated:true, completion:nil)
        } else {
            displayDraw()
        }
    }

}
