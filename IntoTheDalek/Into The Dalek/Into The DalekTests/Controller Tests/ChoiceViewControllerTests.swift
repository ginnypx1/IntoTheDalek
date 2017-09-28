//
//  ChoiceViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class ChoiceViewControllerTests: XCTestCase {
    
    var sut: ChoiceViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "choiceView")
            as! ChoiceViewController
        sut.page = Page()
        sut.page.pageNumber = 1
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test properties exist
    
    func test_choiceTextLabel_Exists() {
        let label = sut.choiceText
        XCTAssertNotNil(label)
    }
    
    func test_yesOrNoControl_Exists() {
        let segControl = sut.yesOrNo
        XCTAssertNotNil(segControl)
    }
    
    func test_choiceText_LoadsCorrectText() {
        let text = sut.choiceText.text
        XCTAssertNotEqual(text, "")
        let expectedText = "  You are surrounded by soldiers with guns. The rebel officers have been waiting for you. They explain: They have captured a strange Dalek and they need your help.\n\n  This strange new Dalek appears to be... GOOD.\n\n  Will you help confirm the existence of a good Dalek?"
        XCTAssertEqual(text, expectedText)
    }
    
    // TODO: Test segues
    
}
