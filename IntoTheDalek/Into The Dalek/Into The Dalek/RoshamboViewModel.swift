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
        roshamboModel.doctorThrows()
    }
    
    func checkResults(userHand: Throw) -> RoundResult {
        return roshamboModel.scoreGame(userHand: userHand)
    }
}
