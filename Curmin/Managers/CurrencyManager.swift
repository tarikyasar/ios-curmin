//
//  CurrencyManager.swift
//  Curmin
//
//  Created by Tarik Yasar on 3.05.2023.
//

import Foundation
import Alamofire

class CurrencyManager {
    let headers: HTTPHeaders = [
        "apiKey": API_KEY
    ]
    
    func getSymbols(
        onCompletion: @escaping ([Symbol]) -> (),
        onError: @escaping (AFError) -> ()
    ) {
        AF.request(
            "\(BASE_URL)/exchangerates_data/symbols",
            headers: headers
        ).responseDecodable(of: SymbolListResponse.self) { response in
            if (response.error != nil) {
                onError(response.error!)
            } else {
                var symbols = [Symbol]()
                
                response.value?.symbols.forEach { symbol in
                    symbols.append(Symbol(code: symbol.key, name: symbol.value))
                }
                
                onCompletion(symbols)
            }
        }
    }
}
