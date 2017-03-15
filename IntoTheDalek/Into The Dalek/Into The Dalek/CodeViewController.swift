//
//  CodeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class CodeViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblCodePart1: UILabel!
    @IBOutlet weak var lblCodePart2: UILabel!
    @IBOutlet weak var lblCodePart3: UILabel!
    @IBOutlet weak var lblCodesTried: UILabel!
    
    // MARK: Properties
    
    var page: Page?
    var codeViewModel = CrackCodeModel()
    
    var labelNumber: Int = 0
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // generateCode
        codeViewModel.generateCode()
        // clear text in codes tried
        lblCodesTried.text?.removeAll()
        codeViewModel.codesTried.removeAll(keepingCapacity: true)
    }
    
    // MARK: - Enter Code
    
    @IBAction func pressZero(_ sender: Any) {
        // send 0 to model view and display 0
        labelNumber += 1
        // add zero to the next label
        switch labelNumber {
        case 1:
            lblCodePart1.text = "0"
            codeViewModel.userAnswer1 = 0
        case 2:
            lblCodePart2.text = "0"
            codeViewModel.userAnswer2 = 0
        case 3:
            lblCodePart3.text = "0"
            codeViewModel.userAnswer3 = 0
            codeViewModel.enterCode()
        default: break
        }
    }
    
    @IBAction func pressOne(_ sender: Any) {
        // send 1 to model view and display 1
        labelNumber += 1
        // add one to the next label
        switch labelNumber {
        case 1:
            lblCodePart1.text = "1"
            codeViewModel.userAnswer1 = 1
        case 2:
            lblCodePart2.text = "1"
            codeViewModel.userAnswer2 = 1
        case 3:
            lblCodePart3.text = "1"
            codeViewModel.userAnswer3 = 1
            codeViewModel.enterCode()
        default: break
        }
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
    
    func die() {
        guard var page = self.page else {
            return
        }
        page.deathNumber = 2
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func crackTheCodeACTION(_ sender: Any) {
        // when button pushed, check for win or loss and segue
        
        // clear info
        lblCodePart1.text?.removeAll()
        lblCodePart2.text?.removeAll()
        lblCodePart3.text?.removeAll()
        labelNumber = 0
        
        // check for win or loss
        switch codeViewModel.testCode() {
        case .win: self.continueStory()
        case .lose: self.die()
        case .undetermined: lblCodesTried.text = "\(codeViewModel.codesTried)"
        }
    }
}
