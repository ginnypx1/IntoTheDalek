//
//  Into_The_DalekUITests.swift
//  Into The DalekUITests
//
//  Created by Ginny Pennekamp on 9/29/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class Into_The_DalekUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_Story_ThroughChoiceDeath() {
        // start the story
        let startButton = app.buttons["Start Button"]
        XCTAssert(startButton.exists)
        
        startButton.tap()
        
        // read first page
        let nextButton = app.buttons["Next Button"]
        XCTAssert(nextButton.exists)
        
        nextButton.tap()
        
        // choose "No" and Die
        let noButton = app.buttons["No"]
        XCTAssert(noButton.exists)
        
        noButton.tap()
        
        // see death screen with option to play again
        let playAgainButton = app.buttons["PlayAgainButton"]
        XCTAssert(playAgainButton.exists)
        
        playAgainButton.tap()
        
        // return to title screen
        XCTAssert(startButton.exists)
    }
    
    func test_Story_ThroughRiddleDeath() {
        // start the story
        let startButton = app.buttons["Start Button"]
        XCTAssert(startButton.exists)
        
        startButton.tap()
        
        // read first page
        let nextButton = app.buttons["Next Button"]
        XCTAssert(nextButton.exists)
        
        nextButton.tap()
        
        // choose "Yes" and Continue
        let yesButton = app.buttons["Yes"]
        XCTAssert(yesButton.exists)
        
        yesButton.tap()
        
        // read the next page
        let nextButton1 = app.buttons["Next Button"]
        XCTAssert(nextButton1.exists)
        
        nextButton1.tap()
        
        // enter an incorrect riddle solution
        
        let riddleSolutionTextField = app.textFields["Enter your question here."]
        XCTAssert(riddleSolutionTextField.exists)
        
        riddleSolutionTextField.tap()
        riddleSolutionTextField.typeText("i don't know what to ask")
        app.typeText("\r")
        
        let solveRiddleButton = app.buttons["Solve the Riddle"]
        XCTAssert(solveRiddleButton.exists)
        
        solveRiddleButton.tap()
        
        // see death screen with option to play again
        let playAgainButton = app.buttons["PlayAgainButton"]
        XCTAssert(playAgainButton.exists)
        
        playAgainButton.tap()
        
        // return to title screen
        XCTAssert(startButton.exists)
    }
    
    func test_Story_ThroughCodeDeath() {
        // start the story
        let startButton = app.buttons["Start Button"]
        XCTAssert(startButton.exists)
        
        startButton.tap()
        
        // read first page
        let nextButton = app.buttons["Next Button"]
        XCTAssert(nextButton.exists)
        
        nextButton.tap()
        
        // choose "Yes" and Continue
        let yesButton = app.buttons["Yes"]
        XCTAssert(yesButton.exists)
        
        yesButton.tap()
        
        // read the next page
        let nextButton1 = app.buttons["Next Button"]
        XCTAssert(nextButton1.exists)
        
        nextButton1.tap()
        
        // enter a correct riddle solution
        
        let riddleSolutionTextField = app.textFields["Enter your question here."]
        XCTAssert(riddleSolutionTextField.exists)
        
        riddleSolutionTextField.tap()
        riddleSolutionTextField.typeText("will the other dalek lie to me?")
        app.typeText("\r")
        
        let solveRiddleButton = app.buttons["Solve the Riddle"]
        XCTAssert(solveRiddleButton.exists)
        
        solveRiddleButton.tap()
        
        // read the next page
        let nextButton2 = app.buttons["Next Button"]
        XCTAssert(nextButton2.exists)
        
        nextButton2.tap()
        
        // read the next page
        let nextButton3 = app.buttons["Next Button"]
        XCTAssert(nextButton3.exists)
        
        nextButton3.tap()
       
        // enter a code
        
        let zeroButton = app/*@START_MENU_TOKEN@*/.buttons["ZeroButton"]/*[[".buttons[\"Zero Button\"]",".buttons[\"ZeroButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(zeroButton.exists)
        
        let oneButton = app/*@START_MENU_TOKEN@*/.buttons["OneButton"]/*[[".buttons[\"One Button\"]",".buttons[\"OneButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(oneButton.exists)
        
        zeroButton.tap()
        zeroButton.tap()
        zeroButton.tap()
        
        let crackCodeButton = app.buttons["Crack Code Button"]
        XCTAssert(crackCodeButton.exists)
        
        crackCodeButton.tap()
        
        // TODO: How do I set a code on this page so I can test win or loss?
    }
    
}
