//
//  ContentView.swift
//  Curmin
//
//  Created by Tarik Yasar on 16.09.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var showSettingsDialog = false
	@State private var showAddToWatchlistDialog = false
	@State var currencies: [CurrencyWatchlistItemData] = []
	
	var body: some View {
		ZStack {
			VStack {
				HStack {
					Button {
						withAnimation {
							showAddToWatchlistDialog = true
						}
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
				
				Spacer()
				
				if (currencies.isEmpty) {
					Text("Empty")
				} else {
					ScrollView {
						CurrencyWatchlistView(currencyWatchlistItems: currencies)
							.padding(.top, 20)
					}
					.refreshable {
						print("Refreshed")
					}
				}
				
				Spacer()
			}
			.frame(maxHeight: .infinity)
			.background(Color.background)
			.blur(radius: (showSettingsDialog || showAddToWatchlistDialog) ? 20 : 0)
			
			
			SettingsDialog(
				showSettingsDialog: $showSettingsDialog,
				onDismiss: {
					withAnimation {
						showSettingsDialog = false
					}
				}
			)
			.shadow(color: Color.black, radius: 5)
			
			AddToWatchlistDialog(
				showDialog: $showAddToWatchlistDialog,
				baseCurrency: "ABC",
				targetCurrency: "ABC",
				onAddButtonClick: { baseCurrency, targetCurrency in
					currencies.append(
						CurrencyWatchlistItemData(
							id: UUID().uuidString,
							baseCurrencyCode: baseCurrency,
							targetCurrencyCode: targetCurrency,
							rate: Double.random(in: 5.0...20.0),
							changeRate: Double.random(in: -0.5...0.5), date: "21.09.2022")
					)
					withAnimation {
						showAddToWatchlistDialog = false
					}
				},
				onDismiss: {
					withAnimation {
						showAddToWatchlistDialog = false
					}
				},
				currencies: ["ABC", "DEF", "ASD", "ZXF", "UKH", "MNO", "KLI", "JMB"]
			)
			.shadow(color: Color.black, radius: 5)
		}
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
