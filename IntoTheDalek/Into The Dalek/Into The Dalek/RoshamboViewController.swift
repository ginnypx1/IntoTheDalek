//
//  RoshamboViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/12/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class RoshamboViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var lblResults: UILabel!
    
    // MARK: - Properties
    
    var page: Page?
    var roshamboViewModel = RoshamboViewModel()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load page text
        if let page = page {
            lblResults.text = page.pageText
        }
    }
    
    // MARK: - Display Results
    
    func displayDraw() {
        // communicates the round has resulted in a draw
        lblResults.text = "It's a draw!\nChoose again."
    }
    
    func continueStory() {
        // this game continues story on a player loss
        guard var page = self.page else {
            return
        }
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func die() {
        // this game results in death for a user win
        guard var page = self.page else {
            return
        }
        page.deathNumber = 3
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func determineResults(userHand: Throw) {
        // communicates with view model to determine proper segue
        switch roshamboViewModel.checkResults(userHand: userHand) {
        case .win: // you win, transition to death
            self.die()
        case .lose: // you lose, continue story
            self.continueStory()
        case .draw:
            self.displayDraw()
        }
    }
    
    // MARK: - select rock, paper or sonic screwdriver
    
    @IBAction func chooseRock(_ sender: Any) {
        // set doctor throw
        roshamboViewModel.doctorThrows()
        // player throws rock
        determineResults(userHand: Throw.rock)
    }
    
    @IBAction func choosePaper(_ sender: Any) {
        // set doctor throw
        roshamboViewModel.doctorThrows()
        // player throws paper
        determineResults(userHand: Throw.paper)
    }
    
    @IBAction func chooseSonicScrewdriver(_ sender: Any) {
        // set doctor throw
        roshamboViewModel.doctorThrows()
        // player throws rock
        determineResults(userHand: Throw.sonicScrewdriver)
    }

}
