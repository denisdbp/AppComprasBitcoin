//
//  ValidaCpfCnpj.swift
//  AppComprasBitcoin
//
//  Created by Admin on 02/01/22.
//

import Foundation
import CPF_CNPJ_Validator
import EmailValidator
import CreditCardValidator

class ValidaDados{
    
    func validaDados(_ cpf: String, _ email: String) -> Bool{
        if BooleanValidator().validate(cpf: cpf) && EmailValidator.validate(email: email){
            return true
        }
        
        return false
}
    
    func validaCartao(_ cartao: String) -> Bool{
        if CreditCardValidator(cartao).isValid {
            return true
        }
        return false
    }
}
