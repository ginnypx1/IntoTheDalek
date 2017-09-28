//
//  RoshamboViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class RoshamboViewControllerTests: XCTestCase {
    
    var sut: RoshamboViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "rpssView")
            as! RoshamboViewController
        sut.page = Page()
        sut.page.pageNumber = 9
        _ = sut.view
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    // MARK: - Test outlets
    
    func test_resultsLabel_Exists() {
        let label = sut.resultsLabel
        XCTAssertNotNil(label)
    }
    
    func test_screwdriverButton_Exists() {
        let button = sut.screwdriverButton
        XCTAssertNotNil(button)
    }
    
    func test_paperButton_Exists() {
        let button = sut.paperButton
        XCTAssertNotNil(button)
    }
    
    func test_rockButton_Exists() {
        let button = sut.rockButton
        XCTAssertNotNil(button)
    }
    
    // MARK: - Test properties
    
    func test_roshamboGame_Exists() {
        let game = sut.roshamboGame
        XCTAssertNotNil(game)
    }
    
    // MARK: - Test initial values
    
    func test_resultsLabel_HasCorrectText() {
        let text = sut.resultsLabel.text
        let expectedText = "  'Rock, Paper, Scissors?' you ask.\n\n  'Of course not! Rock, Paper, Sonic Screwdriver.'"
        XCTAssertEqual(text, expectedText)
    }
    
    // MARK: - Test game methods
    
    func test_displayDraw_displaysDraw() {
        let beforeText = sut.resultsLabel.text
        sut.displayDraw()
        let text = sut.resultsLabel.text
        let expectedText = "It's a draw!\nChoose again."
        XCTAssertNotEqual(beforeText, text)
        XCTAssertEqual(text, expectedText)
    }
    
    // TODO: - test segues
}
