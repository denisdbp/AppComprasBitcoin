//
//  ValidaEmail.swift
//  AppComprasBitcoin
//
//  Created by Admin on 02/01/22.
//

import Foundation
import EmailValidator

class ValidaEmail{
    
    func validaEmail(_ email: String) -> Bool{
        if EmailValidator.validate(email: email){
            return true
        }
        return false
    }
}
