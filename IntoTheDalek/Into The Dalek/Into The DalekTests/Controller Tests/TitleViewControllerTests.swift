//
//  TitleViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class TitleViewControllerTests: XCTestCase {
    
    var sut: TitleViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "titleView")
            as! TitleViewController
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test Properties
    
    func test_StartButton_Exists() {
        let startButton = sut.startButton
        XCTAssertNotNil(startButton)
    }

    // TODO: Test startButton calls startGame()
    // TODO: Test startGame() segues to storyView
    
    
}
