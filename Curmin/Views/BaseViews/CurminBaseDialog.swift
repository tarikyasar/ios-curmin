//
//  CurminBaseDialog.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import SwiftUI

struct CurminBaseDialog<Content: View>: View {
	var content: Content
	var maxHeight: CGFloat
	
	var body: some View {
		VStack {
			content
			
			Spacer()
		}
		.frame(maxWidth: .infinity, minHeight: 200, maxHeight: maxHeight)
		.background(Color.background)
		.cornerRadius(10)
		.padding(.horizontal, 10)
	}
}

struct CurminBaseDialog_Previews: PreviewProvider {
	static var previews: some View {
		CurminBaseDialog(
			content: VStack {
				HStack {
					Text("Settings")
						.frame(alignment: .leading)
						.bold()
						.font(.system(size: 28))
						.padding(.leading, 30)
					
					Spacer()
				}
			},
			maxHeight: 200
		)
	}
}
