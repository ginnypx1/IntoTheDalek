//
//  VictoryViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/29/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class VictoryViewControllerTests: XCTestCase {
    
    var sut: VictoryViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "victoryView")
            as! VictoryViewController
        sut.page = Page()
        sut.page.pageNumber = 19
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test properties

    func test_victoryTextLabel_Exists() {
        let label = sut.victoryText
        XCTAssertNotNil(label)
    }
    
    func test_PlayAgainButton_Exists() {
        let button = sut.playAgainButton
        XCTAssertNotNil(button)
    }
    
    // MARK: - Test property initialization
    
    func test_victoryText_LoadsProperly() {
        let text = sut.victoryText.text
        let expectedText = "  The good Dalek sends a signal to his mothership. He tells the rest of the Dalek force: 'The 'Aristotle' has been destroyed.' The rebels can now operate completely under the Dalek radar.\n\n  You leave them with a new soldier -- the good Dalek.\n\n  You hop on the Tardis and turn the key.\n\n  A new adventure awaits..."
        XCTAssertEqual(text, expectedText)
    }
    
    // TODO: test segue
    
}
