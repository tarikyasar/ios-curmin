//
//  CurrencyWatchlistItemData.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import Foundation

struct CurrencyWatchlistItemData: Identifiable {
	var id: String
	var baseCurrencyCode: String
	var targetCurrencyCode: String
	var rate: Double
	var changeRate: Double
	var date: String
}
