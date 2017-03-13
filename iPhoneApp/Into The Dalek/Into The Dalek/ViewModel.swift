//
//  ViewModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/12/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

struct Page {
    var pageNumber: Int = 0
    var pageText: String
    var pageType: String = "storyView"
    var lastPage: Bool = false
    var deathNumber: Int = 0
    
    init(story: Story) {
        self.pageText = story.intoTheDalek[self.pageNumber]["pageText"]!
        self.pageType = story.intoTheDalek[self.pageNumber]["pageType"]!

    }
    
}

extension StoryViewController {
    func loadNextStoryPage(page: Page) {
        
        var page = page
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewcontroller = storyBoard.instantiateViewController(withIdentifier: "storyView") as! StoryViewController
        
        nextViewcontroller.page = page
        page.pageNumber += 1
        
        self.present(nextViewcontroller, animated:true, completion:nil)
    }
}

extension DeathViewController {
    func loadDeathPage(page: Page) {
        
        var page = page
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewcontroller = storyBoard.instantiateViewController(withIdentifier: "deathView") as! DeathViewController
        
        nextViewcontroller.page = page
        page.lastPage = true
        
        self.present(nextViewcontroller, animated:true, completion:nil)
    }
}
