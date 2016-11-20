//
//  RPSSViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class RPSSViewController: UIViewController {

    @IBOutlet weak var lblResults: UILabel!

    var choices: [String] = ["rock", "paper", "sonic screwdriver"]
    
    var doctorHand: String?
    var playerHand: String?
    
    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblResults.text = "'Rock, Paper, Scissors?' you ask.\n\n  'Of course not! Rock, Paper, Sonic Screwdriver.'"
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
