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
        sut = Roshambo()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test properties
    
    func test_DoctorHand_Exists() {
        let doctorHand = sut.doctorHand
        XCTAssertNotNil(doctorHand)
    }
    
    // MARK - Test initial property values
    
    func test_DoctorHand_DefaultsToSonicScrewdriver() {
        let doctorHand = sut.doctorHand
        XCTAssertEqual(doctorHand, .sonicScrewdriver)
    }
    
    // MARK: - Test methods
    
    func test_DoctorThrows_SetsDoctorHand() {
        sut.doctorThrows()
        let doctorHand = sut.doctorHand
        XCTAssertNotNil(doctorHand)
    }
    
    func test_ScoreGame_CorrectlyCallsWin() {
        let gameResult = sut.checkResults(userHand: .rock)
        XCTAssertEqual(gameResult, .win)
    }
    
    func test_ScoreGame_CorrectlyCallsLoss() {
        let gameResult = sut.checkResults(userHand: .paper)
        XCTAssertEqual(gameResult, .lose)
    }
    
    func test_ScoreGame_CorrectlyCallsDraw() {
        let gameResult = sut.checkResults(userHand: .sonicScrewdriver)
        XCTAssertEqual(gameResult, .draw)
    }
    

    
}
