//
//  PickerViewMes.swift
//  AppComprasBitcoin
//
//  Created by Admin on 07/01/22.
//

import Foundation
import UIKit

protocol PickerViewMesSelecionado {
    func mesSelecionado(mes: String)
}

class PickerViewMes: NSObject, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var mes: Array = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    
    var delegate: PickerViewMesSelecionado?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mes[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if delegate != nil{
            delegate?.mesSelecionado(mes: mes[row])
        }
    }
    

}
