//
//  CurrencyWatchlistItem.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import SwiftUI

struct CurrencyWatchlistItem: View {
	var currencyWatchlistItemData: CurrencyWatchlistItemData
	
	var body: some View {
		ZStack {
			Color.surface
			
			HStack {
				Text("\(currencyWatchlistItemData.baseCurrencyCode)-\(currencyWatchlistItemData.targetCurrencyCode)")
					.padding(.leading, 10)
				
				Spacer()
				
				VStack {
					Spacer()
					
					Text("\(currencyWatchlistItemData.rate, specifier: "%.2f")")
					
					HStack {
						Image(systemName: currencyWatchlistItemData.changeRate < 0.0 ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
							.resizable()
							.frame(width: 10, height: 10)
							.foregroundColor(currencyWatchlistItemData.changeRate < 0.0 ? .colorArrowDown : .colorArrowUp)
						
						Text("\(currencyWatchlistItemData.changeRate, specifier: "%.2f")")
					}
					.padding(6)
					.background(currencyWatchlistItemData.changeRate < 0.0 ? Color.colorDown : Color.colorUp)
					.cornerRadius(8)
					
					
					Spacer()
				}
				
				Spacer()
				
				Text(currencyWatchlistItemData.date)
					.padding(.trailing, 10)
			}
		}
		.cornerRadius(10)
		.frame(height: 60)
		
	}
}

struct CurrencyWatchlistItem_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyWatchlistItem(
			currencyWatchlistItemData: CurrencyWatchlistItemData(
				id: UUID().uuidString,
				baseCurrencyCode: "USD",
				targetCurrencyCode: "TRY",
				rate: 18.40,
				changeRate: -0.25,
				date: "20.09.2022"
			)
		)
	}
}
