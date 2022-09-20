//
//  ContentView.swift
//  Curmin
//
//  Created by Tarik Yasar on 16.09.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var showAlert = false
	@State private var alertMessage = ""
	@State private var showSettingsDialog = false
	
	var currencies = [
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		),
		CurrencyWatchlistItemData(
			id: UUID().uuidString,
			baseCurrencyCode: "USD",
			targetCurrencyCode: "TRY",
			rate: Double.random(in: 5.0...20.0),
			changeRate: Double.random(in: -0.5...0.5),
			date: "20.09.2022"
		)
	]
	
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Button {
						showAlert = true
						alertMessage = "Add Watchlist Item"
					} label: {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.foregroundColor(.onBackground)
							.padding(.leading, 10)
					}
					
					Spacer()
					
					Text("Curmin")
						.bold()
						.font(.system(size: 28))
					
					Spacer()
					
					Button {
						withAnimation {
							showSettingsDialog = true
						}
					} label: {
						Image(systemName: "gearshape.fill")
							.resizable()
							.frame(width: 30, height: 30)
							.foregroundColor(.onBackground)
							.padding(.trailing, 10)
					}
				}
				ScrollView {
					CurrencyWatchlistView(currencyWatchlistItems: currencies)
						.padding(.top, 20)
				}
				.refreshable {
					print("Refreshed")
				}
			}
			.alert(isPresented: $showAlert, content: {
				Alert(title: Text(alertMessage))
			})
			.background(Color.background)
			.blur(radius: showSettingsDialog ? 20 : 0)
			
			
			SettingsDialog(
				showSettingsDialog: $showSettingsDialog,
				onDismiss: {
					withAnimation {
						showSettingsDialog = false
					}
				}
			)
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
