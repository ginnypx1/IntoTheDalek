//
//  DalekTextFieldDelegate.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import Foundation
import UIKit

class DalekTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // clears the textField of default text
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // allows use of the return key
        textField.resignFirstResponder()
        return true
    }
    
    func setUpTextField(_ textField: UITextField) {
        // sets the properties of a textField
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.textAlignment = NSTextAlignment.center
    }
}
