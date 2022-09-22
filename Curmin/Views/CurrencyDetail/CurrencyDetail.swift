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
	
    var body: some View {
		ZStack {
			Color.background
			
			Text("\(baseCurrency)-\(targetCurrency)")
				.onTapGesture {
					self.presentationMode.wrappedValue.dismiss()
				}
		}
		.ignoresSafeArea()
		.toolbar(.hidden)
    }
}
