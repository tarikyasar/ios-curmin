//
//  CurrencyDetail.swift
//  Curmin
//
//  Created by Tarik Yasar on 22.09.2022.
//

import SwiftUI

struct CurrencyDetail: View {
	@Environment(\.presentationMode) var presentationMode
	var baseCurrency: String
	var targetCurrency: String
	var currencyRate: Double
	@State private var baseCurrencyText: String = ""
	@State private var targetCurrencyText: String = ""
	
	var body: some View {
		ZStack {
			Color.background
				.ignoresSafeArea()
			
			VStack {
				HStack {
					Image(systemName: "chevron.backward")
						.resizable()
						.frame(width: 14, height: 20)
						.onTapGesture {
							self.presentationMode.wrappedValue.dismiss()
						}
					
					Spacer()
					
					Text("\(baseCurrency)-\(targetCurrency)")
						.font(.system(size: 24))
						.frame(alignment: .center)
					
					Spacer()
				}
				
				Divider()
				
				Text("Refreshed at: 19.58:40 24.09.2022")
					.font(.system(size: 14))
				
				Divider()
				
				CurrencyConversionView(
					baseCurrencyText: $baseCurrencyText,
					targetCurrencyText: $targetCurrencyText,
					currencyRate: currencyRate,
					baseCurrency: baseCurrency,
					targetCurrency: targetCurrency
				)
				
				Spacer()
			}
			.padding(.horizontal, 10)
		}
		.toolbar(.hidden)
	}
}



struct CurrencyDetail_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyDetail(
			baseCurrency: "ABC",
			targetCurrency: "DEF",
			currencyRate: 19.23
		)
	}
}

