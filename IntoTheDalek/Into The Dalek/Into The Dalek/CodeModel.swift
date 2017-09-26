//
//  CodeModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

enum Result {
    case win
    case lose
    case undetermined
}

class CrackCode {
    
    // MARK: - Properties
    
    var tries: Int = 0
    var doorCode: String = ""
    
    // MARK: - Generates doorCode
    
    func generateCode() {
        let part1 = Int(arc4random_uniform(2))
        let part2 = Int(arc4random_uniform(2))
        let part3 = Int(arc4random_uniform(2))
        self.doorCode = "\(part1)\(part2)\(part3)"
        
        // allows developer to cheat
        print("Door Code: \(self.doorCode)")
    }
    
    // MARK: - checks for win, loss or keep playing
    
    func checkCode(userCode: String) -> Result {
        if userCode == doorCode {
            return Result.win
        } else if tries < 4 {
            self.tries += 1
            return Result.undetermined
        } else {
            return Result.lose
        }
    }
 
}
