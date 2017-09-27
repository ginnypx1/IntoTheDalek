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
        sut = CrackCode()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Test Properties Exist
    
    func test_Tries_Exists() {
        let tries = sut.tries
        XCTAssertNotNil(tries)
    }
    
    func test_DoorCode_Exists() {
        let doorCode = sut.doorCode
        XCTAssertNotNil(doorCode)
    }
    
    func test_UserAnswers_Exist() {
        let userAnswer1 = sut.userAnswer1
        let userAnswer2 = sut.userAnswer2
        let userAnswer3 = sut.userAnswer3
        XCTAssertNotNil(userAnswer1)
        XCTAssertNotNil(userAnswer2)
        XCTAssertNotNil(userAnswer3)
    }
    
    func test_CodesTried_Exists() {
        let codesTried = sut.codesTried
        XCTAssertNotNil(codesTried)
    }
    
    func test_UserCode_Exists() {
        let userCode = sut.userCode
        XCTAssertNotNil(userCode)
    }
    
    // MARK: - Test initial property values
    
    func test_Tries_IsInitiallyZero() {
        let tries = sut.tries
        XCTAssertEqual(tries, 0)
    }
    
    func test_doorCode_IsInitiallyEmpty() {
        let doorCode = sut.doorCode
        XCTAssertEqual(doorCode, "")
    }
    
    func test_UserAnswers_AreInitiallyZero() {
        let userAnswer1 = sut.userAnswer1
        let userAnswer2 = sut.userAnswer2
        let userAnswer3 = sut.userAnswer3
        XCTAssertEqual(userAnswer1, 0)
        XCTAssertEqual(userAnswer2, 0)
        XCTAssertEqual(userAnswer3, 0)
    }
    
    func test_CodesTried_IsInitiallyEmpty() {
        let codesTried = sut.codesTried
        XCTAssertEqual(codesTried.count, 0)
    }
    
    func test_UserCode_IsInitiallyThreeZeros() {
        let userCode = sut.userCode
        XCTAssertEqual(userCode, "000")
    }
    
    // MARK: - Test Methods
    
    func test_GenerateCode_SetsDoorCode() {
        sut.generateCode()
        let doorCode = sut.doorCode
        XCTAssertNotEqual(doorCode, "")
    }
    
    func test_EnterCode_SetsUserCode() {
        sut.userAnswer1 = 1
        sut.userAnswer2 = 1
        sut.userAnswer3 = 1
        sut.enterCode()
        let userCode = sut.userCode
        XCTAssertEqual(userCode, "111")
    }
    
    func test_EnterCode_AddsToCodesTried() {
        sut.userAnswer1 = 1
        sut.userAnswer2 = 1
        sut.userAnswer3 = 1
        sut.enterCode()
        let codesTried = sut.codesTried
        XCTAssertTrue(codesTried.contains("111"))
    }
    
    func test_CheckCode_CorrectlyCallsWin() {
        sut.userCode = "111"
        sut.doorCode = "111"
        let gameResult = sut.checkCode()
        XCTAssertEqual(gameResult, .win)
    }
    
    func test_CheckCode_CorrectlyCallsLoss() {
        sut.doorCode = "111"
        sut.tries = 4
        let gameResult = sut.checkCode()
        XCTAssertEqual(gameResult, .lose)
    }
    
    func test_CheckCode_CorrectCallsUndetermined() {
        sut.doorCode = "111"
        let gameResult = sut.checkCode()
        XCTAssertEqual(gameResult, .undetermined)
    }
    
}
