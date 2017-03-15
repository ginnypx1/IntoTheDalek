//
//  PageModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

struct Page {
    
    // MARK: - Stored Properties
    
    let story = Story()
    
    // MARK: - Variable Properties
    
    var pageNumber: Int  = 0
    var deathNumber: Int = 0
    
    // MARK: - Computed Properties
    
    var pageText: String {
        // pulls the text to display for each page
        var storyText: String = ""
        if let text = story.storyText[self.pageNumber]["pageText"] as? String {
            storyText = text
        }
        return storyText
    }
    var pageType: PageType {
        // pulls the type of page to display for each page
        var storyType: PageType = .storyView
        if let type = story.storyText[self.pageNumber]["pageType"] as? PageType {
            storyType = type
        }
        return storyType
    }
    var deathText: String {
        return story.deathText
    }
    var endText: String {
        // pulls the proper text for each type of death
        return story.endText[self.deathNumber]
    }
    var deathQuip: String {
        // pulls a random quip to display upon death
        let randomNumber: Int = Int(arc4random_uniform(UInt32(self.story.deathQuips.count)))
        return self.story.deathQuips[randomNumber]
    }
}
