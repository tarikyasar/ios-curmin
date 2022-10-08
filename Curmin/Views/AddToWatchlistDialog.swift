//
//  AddToWatchlistDialog.swift
//  Curmin
//
//  Created by Tarik Yasar on 21.09.2022.
//

import SwiftUI

struct AddToWatchlistDialog: View {
	@Binding var showDialog: Bool
	@State var baseCurrency: String
	@State var targetCurrency: String
	@State private var expandedBaseMenu = false
	@State private var expandedTargetMenu = false
	var onAddButtonClick: (String, String) -> Void
	var onDismiss: () -> Void
	var onShowInfoClick: () -> Void
	var currencies: [String]
	
	var body: some View {
		if (showDialog) {
			CurminBaseDialog(
				content:
					VStack {
						HStack {
							Button {
								onShowInfoClick()
							} label: {
								Image(systemName: "info.circle")
									.resizable()
									.frame(width: 20, height: 20)
									.padding(10)
							}
							.foregroundColor(Color.onSurface)
							
							
							Spacer()
							
							Button {
								baseCurrency = currencies[0]
								baseCurrency = currencies[0]
								onDismiss()
							} label: {
								Image(systemName: "xmark")
									.resizable()
									.frame(width: 20, height: 20)
									.padding(10)
							}
							.foregroundColor(Color.onSurface)
							
						}
						
						Spacer()
						
						HStack {
							Text("Base Currency")
								.font(.system(size: 22))
							
							Spacer ()
							
							Menu {
								ForEach(currencies, id: \.self) { currency in
									Button {
										baseCurrency = currency
									} label: {
										Text(currency)
									}
								}
							} label: {
								Text(baseCurrency.isEmpty ? currencies[0] : baseCurrency)
									.padding(.leading, 6)
								
								Image(systemName: expandedBaseMenu ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
									.resizable()
									.frame(width: 8, height: 8)
									.padding(.trailing, 6)
							}
							.onTapGesture {
								expandedBaseMenu = !expandedBaseMenu
							}
							.foregroundColor(.onBackground)
							.padding(10)
							.background(Color.surface)
							.cornerRadius(4)
							
						}
						.padding(.horizontal, 10)
						
						Divider()
						
						HStack {
							Text("Target Currency")
								.font(.system(size: 22))
							
							Spacer ()
							
							Menu {
								ForEach(currencies, id: \.self) { currency in
									Button {
										targetCurrency = currency
									} label: {
										Text(currency)
									}
								}
							} label: {
								Text(targetCurrency.isEmpty ? currencies[0] : targetCurrency)
									.padding(.leading, 6)
								
								Image(systemName: expandedTargetMenu ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
									.resizable()
									.frame(width: 8, height: 8)
									.padding(.trailing, 6)
							}
							.onTapGesture {
								expandedTargetMenu = !expandedTargetMenu
							}
							.foregroundColor(.onBackground)
							.padding(10)
							.background(Color.surface)
							.cornerRadius(4)
						}
						.padding(.horizontal, 10)
						.padding(.bottom, 10)
						
						Spacer()
						
						Button {
							onAddButtonClick(
								baseCurrency,
								targetCurrency
							)
							baseCurrency = currencies[0]
							targetCurrency = currencies[0]
						} label: {
							Text("Add")
								.foregroundColor(.onPrimary)
								.font(.system(size: 30))
								.frame(maxWidth: .infinity)
						}
						.disabled(baseCurrency == targetCurrency)
						.padding(.vertical, 10)
						.background(baseCurrency == targetCurrency ? Color.gray : Color.accentColor)
						.cornerRadius(10)
						.padding(.leading, 10)
					}
				,
				maxHeight: 240
			)
		}
	}
}
