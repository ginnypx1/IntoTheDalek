//
//  AccessibilityManager.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 10/3/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

struct AccessibilityManager {
    
    // MARK - Apply Dynamic Text to Button
    
    static func applyDynamicText(to button: UIButton) {
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

extension StoryViewController {
    func applyAccessibility() {
        textView.accessibilityLabel = page.pageText
        AccessibilityManager.applyDynamicText(to: nextButton)
    }
}

extension DeathViewController {
    func applyAccessibility() {
        lossText.accessibilityLabel = page.endText
        deathQuip.accessibilityLabel = page.deathQuip
        deathText.accessibilityLabel = page.deathText
        AccessibilityManager.applyDynamicText(to: playAgainButton)
    }
}

extension ChoiceViewController {
    func applyAccessibility() {
        choiceText.accessibilityLabel = page.pageText
    }
}

extension RiddleViewController {
    func applyAccessibility() {
        riddleText.accessibilityLabel = page.pageText
        AccessibilityManager.applyDynamicText(to: solveRiddleButton)
    }
}

extension RoshamboViewController {
    func applyAccessibility() {
        resultsLabel.accessibilityLabel = page.pageText
        AccessibilityManager.applyDynamicText(to: screwdriverButton)
        AccessibilityManager.applyDynamicText(to: paperButton)
        AccessibilityManager.applyDynamicText(to: rockButton)
    }
}

extension JokeViewController {
    func applyAccessibility() {
        crossRoadJokeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        crossRoadJokeButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        skinJokeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        skinJokeButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        appleJokeButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        appleJokeButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

extension VictoryViewController {
    func applyAccessibility() {
        victoryText.accessibilityLabel = page.pageText
        AccessibilityManager.applyDynamicText(to: playAgainButton)
    }
}
