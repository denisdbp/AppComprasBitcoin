//
//  LocalizacaoAPI.swift
//  AppComprasBitcoin
//
//  Created by Admin on 04/01/22.
//

import Foundation
import Alamofire

class LocalizacaoAPI{
    
    func localizacaoAPI(_ cep: String, resultado: @escaping (_ localizacao: Localizacao) -> Void) {
        let URL = "https://viacep.com.br/ws/\(cep)/json/"
        AF.request(URL, method: .get).validate().responseDecodable(of: Localizacao.self) {response in
            guard let localizacao = response.value else { return }
            resultado(localizacao)
        }
    }
}
