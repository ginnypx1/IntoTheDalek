//
//  JokeViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/29/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class JokeViewControllerTests: XCTestCase {
    
    var sut: JokeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "jokeView")
            as! JokeViewController
        sut.page = Page()
        sut.page.pageNumber = 16
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test properties
    
    func test_jokeButtons_Exist() {
        let button1 = sut.crossRoadJokeButton
        let button2 = sut.skinJokeButton
        let button3 = sut.appleJokeButton
        XCTAssertNotNil(button1)
        XCTAssertNotNil(button2)
        XCTAssertNotNil(button3)
    }
    
    // TODO: test segues
    
}
