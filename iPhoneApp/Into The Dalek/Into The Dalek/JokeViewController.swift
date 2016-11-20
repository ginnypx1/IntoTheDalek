//
//  JokeViewController.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 11/20/16.
//  Copyright © 2016 GhostBirdGames. All rights reserved.
//

import UIKit


class JokeViewController: UIViewController {

    // MARK: - Apple Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    // MARK: - Tell Jokes
    
    @IBAction func tellAppleJoke(_ sender: Any) {
        // transition to deathNumber 6
        deathNumber = 6
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func tellSkinCareJoke(_ sender: Any) {
        // transition to deathNumber 7
        deathNumber = 7
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @IBAction func tellRoadJoke(_ sender: Any) {
        // transition to next story
        pageCount += 1
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
}
