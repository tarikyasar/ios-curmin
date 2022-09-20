//
//  Themes.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import Foundation

enum Themes {
	case Light
	case Dark
	case SystemTheme

	func getThemeName() -> String {
		switch(self) {
		case .Light: return "Light"
		case .Dark: return "Dark"
		case .SystemTheme: return "System Theme"
		}
	}
}
