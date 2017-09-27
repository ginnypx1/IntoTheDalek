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
        sut = Page()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Page Properties
    
    func test_Story_Exists() {
        let story = sut.story
        XCTAssertNotNil(story)
        
        let firstPart = story.storyText[0]
        let pageText = firstPart["pageText"] as! String
        let pageType = firstPart["pageType"] as! PageType
        let expectedPageText = "  The Tardis flickers to life in the control room of the 'Aristotle'.\n\n  You open the door and shake yourself off, get your bearings. You and the Doctor have just rescued the rebel fighter Journey Blue. Her shuttle was under attack from the Daleks.\n\n  Your Tardis stumbled into the battle and you joined the fight. Now you have returned her safely to her rebel base ship. You expect to enter to cheers, but instead, there is only silence..."
        let expectedPageType = PageType.storyView
        XCTAssertEqual(pageText, expectedPageText)
        XCTAssertEqual(pageType, expectedPageType)
    }
    
    func test_PageNumber_Exists() {
        let pageNumber = sut.pageNumber
        XCTAssertNotNil(pageNumber)
    }
    
    func test_DeathNumber_Exists() {
        let deathNumber = sut.deathNumber
        XCTAssertNotNil(deathNumber)
    }
    
    func test_PageText_Exists() {
        let story = sut.story
        let firstPart = story.storyText[0]
        let pageText = firstPart["pageText"] as! String
        XCTAssertNotNil(pageText)
        XCTAssertNotEqual(pageText, "")
    }
    
    func test_PageType_Exists() {
        let story = sut.story
        let firstPart = story.storyText[0]
        let pageType = firstPart["pageType"] as! PageType
        XCTAssertNotNil(pageType)
    }
    
    func test_DeathText_Exists() {
        let deathText = sut.deathText
        XCTAssertNotNil(deathText)
        XCTAssertNotEqual(deathText, "")
    }
    
    func test_EndText_Exists() {
        let endText = sut.endText
        XCTAssertNotNil(endText)
        XCTAssertNotEqual(endText, "")
    }
    
    func test_DeathQuip_Exists() {
        let deathQuip = sut.deathQuip
        XCTAssertNotNil(deathQuip)
        XCTAssertNotEqual(deathQuip, "")
    }
    
    // MARK: - Test initial property values
    
    func test_PageNumber_IsInitiallyZero() {
        let pageNumber = sut.pageNumber
        XCTAssertEqual(pageNumber, 0)
    }
    
    func test_DeathNumber_IsInitiallyZero() {
        let deathNumber = sut.deathNumber
        XCTAssertEqual(deathNumber, 0)
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
    
    func test_DeathText_SetsAsExpected() {
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
