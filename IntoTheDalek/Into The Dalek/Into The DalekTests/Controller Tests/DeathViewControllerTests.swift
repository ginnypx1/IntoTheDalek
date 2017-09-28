//
//  DeathViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class DeathViewControllerTests: XCTestCase {
    
    var sut: DeathViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "deathView")
            as! DeathViewController
        sut.page = Page()
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test properties
    
    func test_lossTextLabel_Exists() {
        let label = sut.lossText
        XCTAssertNotNil(label)
    }
    
    func test_deathQuipLabel_Exists() {
        let label = sut.deathQuip
        XCTAssertNotNil(label)
    }
    
    func test_deathTextLabel_Exists() {
        let label = sut.deathText
        XCTAssertNotNil(label)
    }
    
    func test_playAgainButton_Exists() {
        let button = sut.playAgainButton
        XCTAssertNotNil(button)
    }
    
    // MARK: - Test initial property values
    
    func test_deathQuip_IsNotEmpty() {
        let deathQuip = sut.deathQuip.text
        XCTAssertNotEqual(deathQuip, "")
    }
    
    func test_deathText_loadsProperty() {
        let deathText = sut.deathText.text
        let expectedText = "Extermination Successful.\n\nThe human race is dead.\n\nCare to rewind the tardis and try it all again?"
        XCTAssertEqual(deathText, expectedText)
    }
    
    func test_endText_Loads() {
        let endText = sut.lossText.text
        XCTAssertNotEqual(endText, "")
        let expectedText = "You are shoved back in your Tardis and released into space."
        XCTAssertEqual(endText, expectedText)
    }
    
    // TODO: Test segues
    
}
