//
//  Alertas.swift
//  AppComprasBitcoin
//
//  Created by Admin on 01/01/22.
//

import Foundation
import UIKit

class Alertas{
    
    func exibeAlerta(titulo: String, mensagem: String, controller: UIViewController){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let botaoOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(botaoOk)
        controller.present(alerta, animated: true, completion: nil)
    }
}
