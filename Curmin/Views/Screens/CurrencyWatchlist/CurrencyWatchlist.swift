//
//  CurrencyWatchlist.swift
//  Curmin
//
//  Created by Tarik Yasar on 22.09.2022.
//

import SwiftUI

struct CurrencyWatchlist: View {
	@State private var showSettingsDialog = false
	@State private var showAddToWatchlistDialog = false
	@State private var showToast = false
	@State var currencies: [CurrencyWatchlistItemData] = [CurrencyWatchlistItemData(id: UUID().uuidString, baseCurrencyCode: "ABC", targetCurrencyCode: "DEF", rate: 10.0, changeRate: 0.05, date: "22.09.2022")]
	@State private var offsets = [CGSize](repeating: CGSize.zero, count: 6)
	
	var body: some View {
		NavigationView {
			ZStack {
				VStack {
					if (currencies.isEmpty) {
						Text("Empty")
					} else {
						ScrollView {
							ForEach(currencies) { item in
								NavigationLink {
									CurrencyDetail(
										baseCurrency: item.baseCurrencyCode,
										targetCurrency: item.targetCurrencyCode,
										currencyRate: item.rate
									)
								} label: {
									CurrencyWatchlistItem(currencyWatchlistItemData: item)
										.padding(.horizontal, 10)
								}
							}
						}
						.padding(.top, 20)
						.refreshable {
							print("Refreshed!")
						}
					}
				}
				.disabled(showSettingsDialog || showAddToWatchlistDialog)
				.frame( maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.background)
				.blur(radius: (showSettingsDialog || showAddToWatchlistDialog) ? 20 : 0)
				.onTapGesture {
					withAnimation {
						showSettingsDialog = false
						showAddToWatchlistDialog = false
					}
				}
				
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
					onShowInfoClick: {
						showToast = true
					},
					currencies: ["ABC", "DEF", "ASD", "ZXF", "UKH", "MNO", "KLI", "JMB"]
				)
				.shadow(color: Color.black, radius: 5)
			}
			.navigationTitle("Curmin")
			.navigationBarTitleDisplayMode(.inline)
			.toast(
				message: "Select base and target currencies. Remember, they must be different from each other.",
				isShowing: $showToast,
				duration: Toast.short)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
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
				}
				
				ToolbarItem(placement: .navigationBarTrailing) {
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
			}
		}
	}
}

struct CurrencyWatchlist_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyWatchlist()
	}
}
