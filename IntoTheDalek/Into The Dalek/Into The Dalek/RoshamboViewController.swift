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
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    // MARK: - Properties
    
    var page: Page!
    var roshamboViewModel = RoshamboViewModel()
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = page.pageText
    }
    
    // MARK: - Display Results
    
    func displayDraw() {
        resultsLabel.text = "It's a draw!\nChoose again."
    }
    
    func continueStory() {
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func die() {
        page.deathNumber = 3
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func determineResults(userHand: Throw) {
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
        roshamboViewModel.doctorThrows()
        determineResults(userHand: Throw.rock)
    }
    
    @IBAction func choosePaper(_ sender: Any) {
        roshamboViewModel.doctorThrows()
        determineResults(userHand: Throw.paper)
    }
    
    @IBAction func chooseSonicScrewdriver(_ sender: Any) {
        roshamboViewModel.doctorThrows()
        determineResults(userHand: Throw.sonicScrewdriver)
    }

}
