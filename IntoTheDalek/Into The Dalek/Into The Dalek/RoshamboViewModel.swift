//
//  RoshamboViewModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

class RoshamboViewModel {
    
    // MARK: - Properties
    
    var roshamboModel = Roshambo()
    
    // MARK: - Methods
    
    func doctorThrows() {
        // view asks model to pick a hand
        roshamboModel.doctorThrows()
    }
    
    func checkResults(userHand: Throw) -> RoundResult {
        // view asks model to score the game
        return roshamboModel.scoreGame(userHand: userHand)
    }
}
