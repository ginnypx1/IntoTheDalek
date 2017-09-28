//
//  StoryViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class StoryViewControllerTests: XCTestCase {
    
    var sut: StoryViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "storyView")
            as! StoryViewController
        
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test properties
    
    func test_textView_Exists() {
        let textView = sut.textView
        XCTAssertNotNil(textView)
    }
    
    func test_nextButton_Exists() {
        let nextButton = sut.nextButton
        XCTAssertNotNil(nextButton)
    }
    
    func test_Page_Exists() {
        let page = sut.page
        XCTAssertNotNil(page)
    }
    
    // MARK: - Test initial story page loads
    
    func test_textView_LoadsPageOne() {
        let text = sut.textView.text
        let expectedText = "  The Tardis flickers to life in the control room of the 'Aristotle'.\n\n  You open the door and shake yourself off, get your bearings. You and the Doctor have just rescued the rebel fighter Journey Blue. Her shuttle was under attack from the Daleks.\n\n  Your Tardis stumbled into the battle and you joined the fight. Now you have returned her safely to her rebel base ship. You expect to enter to cheers, but instead, there is only silence..."
        XCTAssertEqual(text, expectedText)
    }
    
    // MARK: - Test page turn
    
    func test_turnPage_turnsPage() {
        let initialPageNumber = sut.page.pageNumber
        sut.turnPage(sut.nextButton)
        let newPageNumber = sut.page.pageNumber
        XCTAssertNotEqual(initialPageNumber, newPageNumber)
        XCTAssertEqual(newPageNumber, 1)
    }
    
    func test_turnPage_changesText() {
        sut.page.pageNumber = 4
        let pageFourText = "  You turn away from that Dalek and point to the other one. You tell the guards to release him.\n\n  They unlock the chains...\n\n  The Dalek does not kill you. It's a miracle.\n\n  A good Dalek does exist.\n\n  The Doctor asks, 'Do you have a shrink ray on board?'\n\n  Journey Blue answers, 'Of course!'\n\n  The Doctor explains his plan: you'll use the shrink ray to journey inside the good Dalek's mind.\n\n  You wait patiently while the shrink ray warms up...\n\n  5... 4... 3... 2... 1..."
        let pageFiveText = "  You find yourself inside a metal hallway, black with red lights. There are wires everywhere. This is a very complicated machine.\n\n  The Doctor explains that this room forms the Dalek's cortex vault. Dalek technology designed this vault to suppress any compassion... And also to store all of the Dalek's memories.\n\n  There's a simple keypad lock on the Dalek's central vault.\n\n  'Good news!' The Doctor says. 'Only 3 digits... And the Daleks only know 1s and 0s. This should be fairly easy to crack...'\n\n  'But we only get 5 tries, before it shuts down for 24 hours.'"
        sut.turnPage(sut.nextButton)
        let text = sut.textView.text
        XCTAssertNotEqual(text, pageFourText)
        XCTAssertEqual(text, pageFiveText)
    }
    
    // TODO: Test page segues
    
}
