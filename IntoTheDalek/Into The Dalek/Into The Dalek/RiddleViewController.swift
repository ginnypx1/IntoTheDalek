//
//  RiddleViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit

class RiddleViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var riddleText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var solveRiddleButton: UIButton!
    
    // MARK: - Properties
    
    var page: Page!
    let riddleTextFieldDelegate = DalekTextFieldDelegate()

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        riddleTextFieldDelegate.setUpTextField(textField)
        
        riddleText.text = page.pageText
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // subscribe to keyboard notifications
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // unsubscribe to keyboard notifications
        unsubscribeToKeyboardNotifications()
    }
    
    // MARK: - Solve Riddle
    
    func solveRiddle(answer: String) -> Bool {
        return answer.localizedStandardContains("other")
    }
    
    // MARK: - Continue Story or Die
    
    @IBAction func solveRiddle(_ sender: AnyObject) {
        if (!(textField.text?.isEmpty)!) {
            if let answer = textField.text?.lowercased() {
                if solveRiddle(answer: answer) {
                    // continue story
                    page.pageNumber += 1
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
                    nextViewController.page = page
                    navigationController?.pushViewController(nextViewController, animated: true)
                } else {
                    // die
                    page.deathNumber = 1
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
                    nextViewController.page = page
                    navigationController?.pushViewController(nextViewController, animated: true)
                }
            }
        }
    }

}
