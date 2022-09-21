//
//  CurminWarningDialog.swift
//  Curmin
//
//  Created by Tarik Yasar on 21.09.2022.
//

import SwiftUI

struct CurminWarningDialog: View {
	@Binding var showWarningDialog: Bool
	var warningText: String
	var onDismiss: () -> Void
	var onPositiveButtonClick: () -> Void
	var onNegativeButtonClick: () -> Void
	
	var body: some View {
		if (showWarningDialog) {
			CurminBaseDialog(
				content: VStack {
					Image(systemName: "exclamationmark.triangle")
						.resizable()
						.frame(width: 100, height: 100)
						.padding(.vertical, 20)
						.foregroundColor(.colorWarningIcon)
					
					Text(warningText)
						.padding(.horizontal, 20)
						.multilineTextAlignment(.center)
						.font(.system(size: 20))
					
					Spacer()
					
					HStack {
						Button {
							onPositiveButtonClick()
						} label: {
							Text("Yes")
								.foregroundColor(.onPrimary)
								.font(.system(size: 30))
								.frame(maxWidth: .infinity)
						}
						.padding(.vertical, 10)
						.background(Color.accentColor)
						.cornerRadius(10)
						.padding(.leading, 10)
						
						
						Button {
							onNegativeButtonClick()
						} label: {
							Text("No")
								.foregroundColor(.onSurface)
								.font(.system(size: 30))
								.frame(maxWidth: .infinity)
						}
						.padding(.vertical, 10)
						.background(Color.surface)
						.cornerRadius(10)
						.padding(.trailing, 10)
					}
					.padding(.top, 10)
				},
				maxHeight: 310
			)
		}
	}
}
