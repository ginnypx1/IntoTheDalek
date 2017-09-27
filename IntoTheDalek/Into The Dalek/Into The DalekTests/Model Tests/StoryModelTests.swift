//
//  StoryModelTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/27/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class StoryModelTests: XCTestCase {
    
    var sut: Story!
    
    override func setUp() {
        super.setUp()
        sut = Story()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Story Properties
    
    func test_StoryText_Exists() {
        let story = sut.storyText
        XCTAssertNotNil(story)
        XCTAssertNotEqual(story.count, 0)
    }
    
    func test_EndText_Exists() {
        let endText = sut.endText
        XCTAssertNotNil(endText)
        XCTAssertNotEqual(endText.count, 0)
    }
    
    func test_DeathText_Exists() {
        let deathText = sut.deathText
        XCTAssertNotNil(deathText)
        XCTAssertNotEqual(deathText, "")
    }
    
    func test_DeathQuips_Exists() {
        let deathQuips = sut.deathQuips
        XCTAssertNotNil(deathQuips)
        XCTAssertNotEqual(deathQuips.count, 0)
    }
    
}
