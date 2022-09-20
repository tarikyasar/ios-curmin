//
//  SettingsDialog.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import SwiftUI

struct SettingsDialog: View {
	@Binding var showSettingsDialog: Bool
	@State var theme = Themes.SystemTheme
	@State private var expanded = false
	var onDismiss: () -> Void
	
	var body: some View {
		if (showSettingsDialog) {
			CurminBaseDialog(
				content: VStack {
					HStack {
						Text("Settings")
							.bold()
							.font(.system(size: 28))
						
						Spacer()
						
						Button {
							onDismiss()
						} label: {
							Image(systemName: "xmark")
								.resizable()
								.frame(width: 20, height: 20)
								.foregroundColor(.onBackground)
						}
						
					}
					.padding([.horizontal, .vertical], 10)
					
					HStack {
						Text("Theme")
							.font(.system(size: 22))
						
						Spacer ()
						
						Menu {
							Button {
								theme = Themes.Light
							} label: {
								Text(Themes.Light.getThemeName())
							}
							
							Button {
								theme = Themes.Dark
							} label: {
								Text(Themes.Dark.getThemeName())
							}
							
							Button {
								theme = Themes.SystemTheme
							} label: {
								Text(Themes.SystemTheme.getThemeName())
							}
						} label: {
							Text(theme.getThemeName())
								.padding(.leading, 6)
							
							Image(systemName: expanded ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
								.resizable()
								.frame(width: 8, height: 8)
								.padding(.trailing, 6)
						}
						.onTapGesture {
							expanded = !expanded
						}
						.foregroundColor(.onBackground)
						.padding(10)
						.background(Color.surface)
						.cornerRadius(4)
					}
					.padding(.horizontal, 10)
					
					Divider()
				},
				maxHeight: 100
			)
		}
	}
}
