//
//  CurrencyWatchlistView.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import SwiftUI

struct CurrencyWatchlistView: View {
	var currencyWatchlistItems: Array<CurrencyWatchlistItemData>
	
	var body: some View {
		VStack {
			ForEach(currencyWatchlistItems) { item in
				CurrencyWatchlistItem(currencyWatchlistItemData: item)
					.padding(.bottom, 20)
					.padding(.horizontal, 10)
			}
		}
	}
}

struct CurrencyWatchlistView_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyWatchlistView(
			currencyWatchlistItems: Array(
				arrayLiteral: CurrencyWatchlistItemData(
					id: UUID().uuidString,
					baseCurrencyCode: "USD",
					targetCurrencyCode: "TRY",
					rate: 18.40,
					changeRate: -0.25,
					date: "20.09.2022"
				),
				CurrencyWatchlistItemData(
					id: UUID().uuidString,
					baseCurrencyCode: "USD",
					targetCurrencyCode: "TRY",
					rate: 18.40,
					changeRate: -0.25,
					date: "20.09.2022"
				),
				CurrencyWatchlistItemData(
					id: UUID().uuidString,
					baseCurrencyCode: "USD",
					targetCurrencyCode: "TRY",
					rate: 18.40,
					changeRate: -0.25,
					date: "20.09.2022"
				),
				CurrencyWatchlistItemData(
					id: UUID().uuidString,
					baseCurrencyCode: "USD",
					targetCurrencyCode: "TRY",
					rate: 18.40,
					changeRate: -0.25,
					date: "20.09.2022"
				)
			)
		)
	}
}
