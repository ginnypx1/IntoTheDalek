//
//  DalekTextFieldDelegate.swift
//  Into The Dalek
//
//  Created by Ginny Pennekamp on 3/14/17.
//  Copyright © 2017 GhostBirdGames. All rights reserved.
//

import UIKit

class DalekTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setUpTextField(_ textField: UITextField) {
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.done
        textField.textAlignment = NSTextAlignment.center
    }
}
