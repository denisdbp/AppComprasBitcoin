//
//  ValidaCamposTextFields.swift
//  AppComprasBitcoin
//
//  Created by Admin on 01/01/22.
//

import UIKit

class ValidaCamposTextFields {

    func validaCamposTextFieldsTelaDadosPessoais(_ textFields: [UITextField]) -> Bool{
        
        for textField in textFields{
            if textField.text == ""{
                return false
            }
        }
        
        return true
        
    }
    
    func validaCamposTelaPagamento(_ textFields: [UITextField]) -> Bool{
        
        for textField in textFields{
            if textField.text == ""{
                return false
            }
        }
        
        return true
        
    }

}
