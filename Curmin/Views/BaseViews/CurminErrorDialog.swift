//
//  CurminErrorDialog.swift
//  Curmin
//
//  Created by Tarik Yasar on 21.09.2022.
//

import SwiftUI

struct CurminErrorDialog: View {
	@Binding var showErrorDialog: Bool
	var errorText: String
	var onDismiss: () -> Void
	var onPositiveButtonClick: () -> Void
	var onNegativeButtonClick: () -> Void
	
	var body: some View {
		if (showErrorDialog) {
			CurminBaseDialog(
				content: VStack {
					Image(systemName: "x.circle")
						.resizable()
						.frame(width: 100, height: 100)
						.padding(.vertical, 20)
						.foregroundColor(.colorErrorIcon)
					
					Text(errorText)
						.padding(.horizontal, 20)
						.multilineTextAlignment(.center)
						.font(.system(size: 20))
					
					Spacer()
					
					Button {
						onPositiveButtonClick()
					} label: {
						Text("Yes")
							.foregroundColor(.colorErrorForeground)
							.font(.system(size: 30))
							.frame(maxWidth: .infinity)
					}
					.padding(.vertical, 10)
					.background(Color.colorErrorBackground)
					.cornerRadius(10)
					.padding(.leading, 10)
				
				},
				maxHeight: 310
			)
		}
	}
}
