//
//  CurrencyWatchlistItemData.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import Foundation

struct CurrencyWatchlistItemData: Codable, Identifiable {
	let id: String
    let baseCurrencyCode: String
    let targetCurrencyCode: String
    let rate: Double
    let changeRate: Double
    let date: String
    
    static var sampleCurrencyWatchlistItemData = CurrencyWatchlistItemData(
        id: UUID().uuidString,
        baseCurrencyCode: "USD",
        targetCurrencyCode: "TRY",
        rate: 18.40,
        changeRate: -0.25,
        date: "20.09.2022"
    )
}
