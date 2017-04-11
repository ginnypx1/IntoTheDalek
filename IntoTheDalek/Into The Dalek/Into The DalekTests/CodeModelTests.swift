//
//  CodeModelTests.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 4/11/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class CodeModelTests: XCTestCase {
    
    var sut: CrackCode!
    
    override func setUp() {
        super.setUp()
        // init code game
        sut = CrackCode()
    }
    
    override func tearDown() {
        // deinit code game
        sut = nil
        super.tearDown()
    }
    
    func test_GenerateCode_SetsDoorCode() {
        sut.generateCode()
        let doorCode = sut.doorCode
        XCTAssertNotEqual(doorCode, "")
    }
    
    func test_CheckCode_CorrectlyCallsWin() {
        sut.doorCode = "111"
        let gameResult = sut.checkCode(userCode: "111")
        XCTAssertEqual(gameResult, Result.win)
    }
    
    func test_CheckCode_CorrectlyCallsLoss() {
        sut.tries = 4
        let gameResult = sut.checkCode(userCode: "111")
        XCTAssertEqual(gameResult, Result.lose)
    }
    
    func test_CheckCode_CorrectCallsUndetermined() {
        let gameResult = sut.checkCode(userCode: "111")
        XCTAssertEqual(gameResult, Result.undetermined)
    }
    
}
