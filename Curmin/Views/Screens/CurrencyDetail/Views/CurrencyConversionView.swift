//
//  CurrencyConversionView.swift
//  Curmin
//
//  Created by Tarik Yasar on 24.09.2022.
//

import SwiftUI

struct CurrencyConversionView: View {
	@Binding var baseCurrencyText: String
	@Binding var targetCurrencyText: String
	var currencyRate: Double
	var baseCurrency: String
	var targetCurrency: String
	
	var body: some View {
		VStack {
			Text("Currency Conversion")
				.font(.system(size: 18))
			
			ZStack(alignment: .trailing) {
				TextField("", text: $baseCurrencyText)
					.padding(10)
					.background(Color.surface)
					.cornerRadius(10)
					.keyboardType(.decimalPad)
					.onChange(of: baseCurrencyText){
						targetCurrencyText = String(Double($0)! * currencyRate)
					}
				
				
				HStack {
					Divider()
						.frame(height: 20)
					
					Text(baseCurrency)
						.padding(.trailing, 20)
						.foregroundColor(Color.gray)
				}
				
			}
			
			ZStack(alignment: .trailing) {
				TextField("", text: $targetCurrencyText)
					.padding(10)
					.background(Color.surface)
					.cornerRadius(10)
					.keyboardType(.decimalPad)
				
				HStack {
					Divider()
						.frame(height: 20)
					
					Text(targetCurrency)
						.padding(.trailing, 20)
						.foregroundColor(Color.gray)
				}
			}
		}
	}
}
