//
//  PageModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

enum PageType {
    case storyView
    case choiceView
    case riddleView
    case codeView
    case rpssView
    case laserView
    case jokeView
    case victoryView
}

struct Page {
    
    // MARK: -  Properties
    
    let story = Story()
    
    var pageNumber: Int  = 0
    var deathNumber: Int = 0
    
    var pageText: String {
        var storyText: String = ""
        if let text = story.storyText[self.pageNumber]["pageText"] as? String {
            storyText = text
        }
        return storyText
    }
    
    var pageType: PageType {
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
        return story.endText[self.deathNumber]
    }
    
    var deathQuip: String {
        let randomNumber: Int = Int(arc4random_uniform(UInt32(self.story.deathQuips.count)))
        return self.story.deathQuips[randomNumber]
    }
}
