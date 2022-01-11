//
//  PickerViewAno.swift
//  AppComprasBitcoin
//
//  Created by Admin on 07/01/22.
//

import Foundation
import UIKit

protocol PickerViewAnoSelecionado {
    func anoSelecionado(ano: String)
}

class PickerViewAno: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var anos: Array = ["2022", "2023", "2024", "2025", "2026"]
    
    var delegate: PickerViewAnoSelecionado?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        anos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return anos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.anoSelecionado(ano: anos[row])
        }
    }
    
    
    
}
