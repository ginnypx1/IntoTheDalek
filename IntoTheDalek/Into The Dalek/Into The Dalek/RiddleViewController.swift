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
    
    @IBOutlet weak var lblRiddleText: UILabel!
    @IBOutlet weak var txtInputRiddle: UITextField!
    
    // MARK: - Properties
    
    var page: Page?
    let riddleTextFieldDelegate = DalekTextFieldDelegate()

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set text field delegate
        riddleTextFieldDelegate.setUpTextField(txtInputRiddle)
        // load riddle directions
        if let page = page {
            lblRiddleText.text = page.pageText
        }
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
    
    @IBAction func solveRiddleACTION(_ sender: AnyObject) {
        guard var page = self.page else {
            return
        }

        if (!(txtInputRiddle.text?.isEmpty)!) {
            if let answer = txtInputRiddle.text?.lowercased() {
                if solveRiddle(answer: answer) {
                    // continue story
                    page.pageNumber += 1
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
                    nextViewController.page = page
                    self.present(nextViewController, animated:true, completion:nil)
                } else {
                    // die
                    page.deathNumber = 1
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
                    nextViewController.page = page
                    self.present(nextViewController, animated:true, completion:nil)
                }
            }
        }
    }

}
