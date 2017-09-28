//
//  LaserViewControllerTests.swift
//  Into The DalekTests
//
//  Created by Ginny Pennekamp on 9/28/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import XCTest
@testable import Into_The_Dalek

class LaserViewControllerTests: XCTestCase {
    
    var sut: LaserViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard
            .instantiateViewController(
                withIdentifier: "laserView")
            as! LaserViewController
        sut.page = Page()
        sut.page.pageNumber = 12
        _ = sut.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test outlets
    
    func test_laserLabels_Exist() {
        let labels = sut.laserLabels
        XCTAssertNotNil(labels)
        XCTAssertNotEqual(labels?.count, 0)
    }
    
    func test_loadButton_Exists() {
        let button = sut.loadButton
        XCTAssertNotNil(button)
    }
    
    func test_shootButton_Exists() {
        let button = sut.shootButton
        XCTAssertNotNil(button)
    }
    
    // MARK: - Test properties
    
    func test_shotCount_Exists() {
        let shotCount = sut.shotCount
        XCTAssertNotNil(shotCount)
    }
    
    func test_shotCount_IsInitiallyNegativeOne() {
        let shotCount = sut.shotCount
        XCTAssertEqual(shotCount, -1)
    }
    
    // MARK: - Test methods
    
    func test_displayLoad_DisplaysProperColors() {
        sut.shotCount = 13
        sut.displayLoad()
        let level1Color = sut.laserLabels[0].backgroundColor
        let level2Color = sut.laserLabels[4].backgroundColor
        let level3Color = sut.laserLabels[8].backgroundColor
        let level4Color = sut.laserLabels[12].backgroundColor
        XCTAssertEqual(level1Color, .yellow)
        XCTAssertEqual(level2Color, .orange)
        XCTAssertEqual(level3Color, .red)
        XCTAssertEqual(level4Color, .brown)
    }
    
    func test_loadLaser_IncreasesShotCount() {
        let initialShotCount = sut.shotCount
        sut.loadLaser(sut.loadButton)
        let newShotCount = sut.shotCount
        XCTAssertNotEqual(initialShotCount, newShotCount)
        XCTAssertEqual(newShotCount, 0)
    }
    
    // TODO: - test segues
    
}
