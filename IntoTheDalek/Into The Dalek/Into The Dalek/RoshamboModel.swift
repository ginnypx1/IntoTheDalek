//
//  RoshamboModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

enum Throw {
    case rock
    case paper
    case sonicScrewdriver
}

enum RoundResult {
    case win
    case lose
    case draw
}

class Roshambo {
    
    // MARK: - Properties
    
    var doctorHand: Throw = .sonicScrewdriver
    
    // MARK: - Methods
    
    func doctorThrows() {
        let randomNumber = Int(arc4random_uniform(3))
        switch randomNumber {
        case 0: self.doctorHand = Throw.rock
        case 1: self.doctorHand = Throw.paper
        case 2: self.doctorHand = Throw.sonicScrewdriver
        default: break
        }
        
        // allows the developer to test
        print("The Doctor throws: \(self.doctorHand)")
    }
    
    func checkResults(userHand: Throw) -> RoundResult {
        // allows the developer to test
        print("Player throws: \(userHand)")
        
        if doctorHand == userHand {
            return .draw
        } else {
            switch self.doctorHand {
            case .rock:
                if userHand == .paper {
                    return .win
                } else {
                    return .lose
                }
            case .paper:
                if userHand == .sonicScrewdriver {
                    return .win
                } else {
                    return .lose
                }
            case .sonicScrewdriver:
                if userHand == .rock {
                    return .win
                } else {
                    return .lose
                }
            }
        }
    }
}
