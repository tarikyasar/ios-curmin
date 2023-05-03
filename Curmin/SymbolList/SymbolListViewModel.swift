//
//  SymbolListViewModel.swift
//  Curmin
//
//  Created by Tarik Yasar on 3.05.2023.
//

import Foundation
import Alamofire

class SymbolListViewModel: ObservableObject {
    private let currencyManager = CurrencyManager()
    
    @Published var isLoading: Bool = true
    @Published var error: Error? = nil
    
    @Published var symbols: [Symbol]? = nil
    
    func getSymbols() {
        self.isLoading = true
        
        currencyManager.getSymbols(onCompletion: { result in
            self.symbols = result
        }, onError: { error in
            self.error = error
        })
        
        self.isLoading = false
    }
}
