//
//  PageModelTests.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 4/11/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class PageModelTests: XCTestCase {
    
    var sut: Page!
    
    override func setUp() {
        super.setUp()
        // init page
        sut = Page()
    }
    
    override func tearDown() {
        // deinit page
        sut = nil
        super.tearDown()
    }
    
    func test_Story_Exists() {
        let story = sut.story
        let firstPart = story.storyText[0]
        let pageText = firstPart["pageText"] as! String
        let pageType = firstPart["pageType"] as! PageType
        let expectedPageText = "  The Tardis flickers to life in the control room of the 'Aristotle'.\n\n  You open the door and shake yourself off, get your bearings. You and the Doctor have just rescued the rebel fighter Journey Blue. Her shuttle was under attack from the Daleks.\n\n  Your Tardis stumbled into the battle and you joined the fight. Now you have returned her safely to her rebel base ship. You expect to enter to cheers, but instead, there is only silence..."
        let expectedPageType = PageType.storyView
        XCTAssertEqual(pageText, expectedPageText)
        XCTAssertEqual(pageType, expectedPageType)
    }
    
    func test_PageText_SetsAsExpected() {
        let pageText = sut.pageText
        let expectedPageText = "  The Tardis flickers to life in the control room of the 'Aristotle'.\n\n  You open the door and shake yourself off, get your bearings. You and the Doctor have just rescued the rebel fighter Journey Blue. Her shuttle was under attack from the Daleks.\n\n  Your Tardis stumbled into the battle and you joined the fight. Now you have returned her safely to her rebel base ship. You expect to enter to cheers, but instead, there is only silence..."
        XCTAssertEqual(pageText, expectedPageText)
    }
    
    func test_PageType_SetsAsExpected() {
        let pageType = sut.pageType
        let expectedPageType = PageType.storyView
        XCTAssertEqual(pageType, expectedPageType)
    }
    
    func test_DeathText_Exists() {
        let deathText = sut.deathText
        let expectedDeathText = "Extermination Successful.\n\nThe human race is dead.\n\nCare to rewind the tardis and try it all again?"
        
        XCTAssertEqual(deathText, expectedDeathText)
    }
    
    func test_EndText_SetsAsExpected() {
        let endText = sut.endText
        let expectedEndText = "You are shoved back in your Tardis and released into space."
        
        XCTAssertEqual(endText, expectedEndText)
    }
    
}
