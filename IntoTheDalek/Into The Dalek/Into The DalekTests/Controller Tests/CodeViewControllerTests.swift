//
//  CodeViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class CodeViewControllerTests: XCTestCase {
    
    var sut: CodeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "codeView")
            as! CodeViewController
        sut.page = Page()
        sut.page.pageNumber = 6
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test Outlets Exist
    
    func test_codeLabels_Exist() {
        let label1 = sut.codePart1
        let label2 = sut.codePart2
        let label3 = sut.codePart3
        XCTAssertNotNil(label1)
        XCTAssertNotNil(label2)
        XCTAssertNotNil(label3)
    }
    
    func test_codesTriedLabel_Exists() {
        let label = sut.codesTried
        XCTAssertNotNil(label)
    }
    
    func test_crackCodeButton_Exists() {
        let button = sut.crackCodeButton
        XCTAssertNotNil(button)
    }
    
    func test_zeroButton_Exists() {
        let button = sut.zeroButton
        XCTAssertNotNil(button)
    }
    
    func test_oneButton_Exists() {
        let button = sut.oneButton
        XCTAssertNotNil(button)
    }
    
    // MARK - Test Properties
    
    func test_codeModel_Exists() {
        let codeModel = sut.codeModel
        XCTAssertNotNil(codeModel)
    }
    
    func test_labelNumber_Exists() {
        let labelNumber = sut.labelNumber
        XCTAssertNotNil(labelNumber)
    }
    
    func test_labelNumber_IsInitiallyZero() {
        let labelNumber = sut.labelNumber
        XCTAssertEqual(labelNumber, 0)
    }
    
    // MARK: - Test Game Set-up
    
    func test_doorCode_IsGenerated() {
        let doorCode = sut.codeModel.doorCode
        XCTAssertNotNil(doorCode)
        XCTAssertNotEqual(doorCode, "")
    }
    
    func test_codesTried_IsInitiallyEmpty() {
        let codesTried = sut.codeModel.codesTried
        let codesTriedText = sut.codesTried.text
        XCTAssertEqual(codesTried.count, 0)
        XCTAssertEqual("", codesTriedText)
    }
    
    // MARK: - Test game methods
    
    func test_pressZero_IncreasesLabelNumber() {
        let initialLabelNumber = sut.labelNumber
        sut.pressZero(sut.zeroButton)
        let newLabelNumber = sut.labelNumber
        XCTAssertNotEqual(initialLabelNumber, newLabelNumber)
        XCTAssertEqual(newLabelNumber, 1)
    }
    
    func test_pressZero_SetsZero() {
        sut.codeModel.userAnswer1 = 1
        sut.codePart1.text = "1"
        sut.labelNumber = 0
        sut.pressZero(sut.zeroButton)
        let newUserAnswer = sut.codeModel.userAnswer1
        let newCodeText = sut.codePart1.text
        XCTAssertEqual(newUserAnswer, 0)
        XCTAssertEqual(newCodeText, "0")
    }
    
    func test_pressZero_EntersCode() {
        sut.codeModel.doorCode = "111"
        sut.codeModel.userAnswer1 = 1
        sut.codeModel.userAnswer2 = 1
        sut.codePart1.text = "1"
        sut.codePart2.text = "1"
        sut.labelNumber = 2
        sut.pressZero(sut.zeroButton)
        let newUserAnswer = sut.codeModel.userAnswer3
        let newCodeText = sut.codePart3.text
        XCTAssertEqual(newUserAnswer, 0)
        XCTAssertEqual(newCodeText, "0")
        let userCode = sut.codeModel.userCode
        XCTAssertEqual(userCode, "110")
        let codesTried = sut.codeModel.codesTried
        XCTAssertTrue(codesTried.contains("110"))
    }
    
    func test_pressOne_IncreasesLabelNumber() {
        let initialLabelNumber = sut.labelNumber
        sut.pressOne(sut.oneButton)
        let newLabelNumber = sut.labelNumber
        XCTAssertNotEqual(initialLabelNumber, newLabelNumber)
        XCTAssertEqual(newLabelNumber, 1)
    }
    
    func test_pressOne_SetsOne() {
        sut.codeModel.userAnswer1 = 0
        sut.codePart1.text = "0"
        sut.labelNumber = 0
        sut.pressOne(sut.oneButton)
        let newUserAnswer = sut.codeModel.userAnswer1
        let newCodeText = sut.codePart1.text
        XCTAssertEqual(newUserAnswer, 1)
        XCTAssertEqual(newCodeText, "1")
    }
    
    func test_pressOne_EntersCode() {
        sut.codeModel.doorCode = "000"
        sut.codeModel.userAnswer1 = 0
        sut.codeModel.userAnswer2 = 0
        sut.codePart1.text = "0"
        sut.codePart2.text = "0"
        sut.labelNumber = 2
        sut.pressOne(sut.oneButton)
        let newUserAnswer = sut.codeModel.userAnswer3
        let newCodeText = sut.codePart3.text
        XCTAssertEqual(newUserAnswer, 1)
        XCTAssertEqual(newCodeText, "1")
        let userCode = sut.codeModel.userCode
        XCTAssertEqual(userCode, "001")
        let codesTried = sut.codeModel.codesTried
        XCTAssertTrue(codesTried.contains("001"))
    }
    
    func test_crackTheCode_removesCodeText() {
        sut.codePart1.text = "0"
        sut.codePart2.text = "0"
        sut.codePart3.text = "0"
        sut.crackTheCode(sut.crackCodeButton)
        let code1Text = sut.codePart1.text
        let code2Text = sut.codePart2.text
        let code3Text = sut.codePart3.text
        XCTAssertEqual(code1Text, "")
        XCTAssertEqual(code2Text, "")
        XCTAssertEqual(code3Text, "")
    }
    
    func test_crackTheCode_resetsLabelNumber() {
        sut.labelNumber = 2
        sut.crackTheCode(sut.crackCodeButton)
        let labelNumber = sut.labelNumber
        XCTAssertNotEqual(2, labelNumber)
        XCTAssertEqual(labelNumber, 0)
    }
    
    // TODO: Test segues
    
}
