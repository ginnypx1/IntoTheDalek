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
    
    @IBOutlet weak var codePart1: UILabel!
    @IBOutlet weak var codePart2: UILabel!
    @IBOutlet weak var codePart3: UILabel!
    @IBOutlet weak var codesTried: UILabel!
    
    // MARK: Properties
    
    var page: Page!
    var codeModel = CrackCode()
    
    var labelNumber: Int = 0
    
    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        codeModel.generateCode()
        
        codesTried.text?.removeAll()
        codeModel.codesTried.removeAll(keepingCapacity: true)
    }
    
    // MARK: - Enter Code
    
    @IBAction func pressZero(_ sender: Any) {
        labelNumber += 1
        
        switch labelNumber {
        case 1:
            codePart1.text = "0"
            codeModel.userAnswer1 = 0
        case 2:
            codePart2.text = "0"
            codeModel.userAnswer2 = 0
        case 3:
            codePart3.text = "0"
            codeModel.userAnswer3 = 0
            codeModel.enterCode()
        default: break
        }
    }
    
    @IBAction func pressOne(_ sender: Any) {
        labelNumber += 1
       
        switch labelNumber {
        case 1:
            codePart1.text = "1"
            codeModel.userAnswer1 = 1
        case 2:
            codePart2.text = "1"
            codeModel.userAnswer2 = 1
        case 3:
            codePart3.text = "1"
            codeModel.userAnswer3 = 1
            codeModel.enterCode()
        default: break
        }
    }
    
    // MARK: - Display Results
    
    func continueStory() {
        page.pageNumber += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func die() {
        page.deathNumber = 2
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        nextViewController.page = page
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func crackTheCode(_ sender: Any) {
        // clear info
        codePart1.text?.removeAll()
        codePart2.text?.removeAll()
        codePart3.text?.removeAll()
        labelNumber = 0
        
        // check for win or loss
        switch codeModel.checkCode() {
        case .win: self.continueStory()
        case .lose: self.die()
        case .undetermined: codesTried.text = "\(codeModel.codesTried)"
        }
    }

}
