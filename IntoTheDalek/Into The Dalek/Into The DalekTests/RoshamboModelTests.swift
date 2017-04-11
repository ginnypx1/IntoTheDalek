//
//  RoshamboModelTests.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 4/11/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class RoshamboModelTests: XCTestCase {
    
    var sut: Roshambo!
    
    override func setUp() {
        super.setUp()
        // init game
        sut = Roshambo()
    }
    
    override func tearDown() {
        // deinit game
        sut = nil
        super.tearDown()
    }
    
    func test_ScoreGame_CorrectlyCallsWin() {
        let gameResult = sut.scoreGame(userHand: Throw.rock)
        XCTAssertEqual(gameResult, RoundResult.win)
    }
    
    func test_ScoreGame_CorrectlyCallsLoss() {
        let gameResult = sut.scoreGame(userHand: Throw.paper)
        XCTAssertEqual(gameResult, RoundResult.lose)
    }
    
    func test_ScoreGame_CorrectlyCallsDraw() {
        let gameResult = sut.scoreGame(userHand: Throw.sonicScrewdriver)
        XCTAssertEqual(gameResult, RoundResult.draw)
    }
    

    
}
