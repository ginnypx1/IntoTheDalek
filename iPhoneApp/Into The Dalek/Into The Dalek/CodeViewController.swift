//
//  CodeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/24/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class CodeViewController: UIViewController {
    
    @IBOutlet weak var lblCodePart1: UILabel!
    @IBOutlet weak var lblCodePart2: UILabel!
    @IBOutlet weak var lblCodePart3: UILabel!
    @IBOutlet weak var lblCodesTried: UILabel!
    
    var codesTried: [String] = []
    var tries: Int = 0
    
    var correctAnswer: String = "000"
    
    var userAnswer1: Int = 0
    var userAnswer2: Int = 0
    var userAnswer3: Int = 0
    var tryCode: String?
    
    var labelNumber: Int = 0
    
    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblCodesTried.text?.removeAll()
        codesTried.removeAll(keepingCapacity: true)
        
        generateCode()
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
    
    // MARK: - Generate Dalek Code
    
    func generateCode() {
        let part1 = Int(arc4random_uniform(2))
        let part2 = Int(arc4random_uniform(2))
        let part3 = Int(arc4random_uniform(2))
        correctAnswer = "\(part1)\(part2)\(part3)"
    }
    
    // MARK: - Play Guessing Game
    
    @IBAction func pressZero(_ sender: Any) {
        labelNumber += 1
        // add zero to the next label
        switch labelNumber {
        case 1:
            lblCodePart1.text = "0"
            userAnswer1 = 0
        case 2:
            lblCodePart2.text = "0"
            userAnswer2 = 0
        case 3:
            lblCodePart3.text = "0"
            userAnswer3 = 0
            tryCode = "\(userAnswer1)\(userAnswer2)\(userAnswer3)"
        default:
            break
        }
    }
    
    @IBAction func pressOne(_ sender: Any) {
        labelNumber += 1
        // add one to the next label
        switch labelNumber {
        case 1:
            lblCodePart1.text = "1"
            userAnswer1 = 1
        case 2:
            lblCodePart2.text = "1"
            userAnswer2 = 1
        case 3:
            lblCodePart3.text = "1"
            userAnswer3 = 1
            tryCode = "\(userAnswer1)\(userAnswer2)\(userAnswer3)"
        default:
            break
        }
    }
    
    @IBAction func crackTheCodeACTION(_ sender: Any) {
        if (tryCode != nil) {
            print("correctAnswer: \(correctAnswer)")
            print("tryCode: \(tryCode)")
            if (tries < 4) {
                if (tryCode == correctAnswer) {
                    pageCount += 1
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
                    self.present(nextViewController, animated:true, completion:nil)
                } else {
                    tries += 1
                    codesTried.append(tryCode!)
                    lblCodesTried.text = "\(codesTried)"
                    lblCodePart1.text?.removeAll()
                    lblCodePart2.text?.removeAll()
                    lblCodePart3.text?.removeAll()
                    labelNumber = 0
                }
            } else {
                deathNumber = 2
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
                self.present(nextViewController, animated:true, completion:nil)
            }
        }
    }
}
