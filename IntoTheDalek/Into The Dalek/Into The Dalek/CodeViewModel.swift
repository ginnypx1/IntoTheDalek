//
//  CodeViewModel.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

class CrackCodeModel {
    
    // MARK: - Properties
    
    var codeModel = CrackCode()
    
    var userAnswer1: Int = 0
    var userAnswer2: Int = 0
    var userAnswer3: Int = 0
    var codesTried: [String] = []
    
    var userCode: String = "000"
    
    // MARK: - Methods
    
    func generateCode() {
        // communicates setting doorCode from model to view controller
        codeModel.generateCode()
    }
    
    func enterCode() {
        // adds an entry into the codesTried
        self.userCode = "\(userAnswer1)\(userAnswer2)\(userAnswer3)"
        self.codesTried.append(self.userCode)
    }
    
    func testCode() -> Result {
        // tests userCode against the model
        return codeModel.checkCode(userCode: self.userCode)
    }

}
