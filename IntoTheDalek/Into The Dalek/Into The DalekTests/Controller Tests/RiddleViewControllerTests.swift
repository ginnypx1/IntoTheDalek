//
//  RiddleViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class RiddleViewControllerTests: XCTestCase {
    
    var sut: RiddleViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "riddleView")
            as! RiddleViewController
        sut.page = Page()
        sut.page.pageNumber = 3
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test Properties
    
    func test_riddleTextLabel_Exists() {
        let label = sut.riddleText
        XCTAssertNotNil(label)
    }
    
    func test_textField_Exists() {
        let textField = sut.textField
        XCTAssertNotNil(textField)
    }
    
    func test_solveRiddleButton_Exists() {
        let button = sut.solveRiddleButton
        XCTAssertNotNil(button)
    }
    
    func test_riddleTextFieldDelegate_Exists() {
        let delegate = sut.riddleTextFieldDelegate
        XCTAssertNotNil(delegate)
    }
    
    func test_riddleTextFieldDelegate_IsCorrect() {
        XCTAssertTrue(sut.textField.delegate is DalekTextFieldDelegate)
    }
    
    // TODO: - Test text field sets up correctly
    // TODO: - Test keyboard notifications
    
    // MARK: - Test initial values load properly
    
    func test_riddle_LoadsCorrectly() {
        let riddle = sut.riddleText.text
        XCTAssertNotEqual(riddle, "")
        let expectedText = "Remember:\n\nOne Dalek lies.\n\nThe other tells the truth.\n\nYou decide to ask the Dalek on the left:"
        XCTAssertEqual(riddle, expectedText)
    }
    
    // MARK: - Test methods
    
    func test_solveRiddle_SolvesRiddle() {
        let answer = "Will the other Dalek lie?"
        let isSolved = sut.solveRiddle(answer: answer)
        XCTAssertTrue(isSolved)
    }
    
    func test_solveRiddle_RejectsBadAnswer() {
        let answer = "I have no idea!"
        let isSolved = sut.solveRiddle(answer: answer)
        XCTAssertFalse(isSolved)
    }
    
    // TODO: Test segues
    
}
