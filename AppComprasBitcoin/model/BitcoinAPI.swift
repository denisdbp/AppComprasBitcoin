//
//  BitcoinAPI.swift
//  AppComprasBitcoin
//
//  Created by Admin on 04/01/22.
//

import Foundation
import Alamofire

class BitcoinAPI {
    
    func bitcoinAPI(preco: @escaping(_ bitcoin: Bitcoin) -> Void){
        AF.request("https://api.bitpreco.com/btc-brl/ticker", method: .get).validate().responseDecodable(of: Bitcoin.self){response in
            guard let bitcoin = response.value else { return}
            preco(bitcoin)
        }
    }
}
