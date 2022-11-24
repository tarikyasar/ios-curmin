//
//  CurrencyWatchlistItem.swift
//  Curmin
//
//  Created by Tarik Yasar on 20.09.2022.
//

import SwiftUI

struct CurrencyWatchlistItem: View {
	var currencyWatchlistItemData: CurrencyWatchlistItemData
    var onDeleteAction: () -> Void
    var onClick: () -> Void

    @State var xOffSet: CGFloat = 0
	
	var body: some View {
		ZStack {
            ZStack {
                Color.colorDown
                
                HStack {
                    Spacer()
                    
                    Image(systemName: "trash")
                        .font(.system(size: 24))
                        .foregroundColor(.colorArrowDown)
                        .padding(.trailing, 16)
                }
                .onTapGesture {
                    onDeleteAction()
                }
            }
			
            CurrencyWatchlistItemContent(currencyWatchlistItemData: currencyWatchlistItemData)
                .onTapGesture {
                    onClick()
                }
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onChanged { value in
                        let horizontalDragAmount = value.translation.width <= 0 ? value.translation.width : 0
                        
                        if (horizontalDragAmount >= -70) {
                            xOffSet = horizontalDragAmount
                        }
                    }
                    .onEnded { value in
                        if (value.translation.width <= -60) {
                            xOffSet = -60
                        } else {
                            xOffSet = 0
                        }
                    }
                )
                .offset(x: xOffSet)
		}
        .frame(height: 80)
		.cornerRadius(10)
	}
}

struct CurrencyWatchlistItemContent: View {
    var currencyWatchlistItemData: CurrencyWatchlistItemData
    
    var body: some View {
        Color.surface
        
        HStack {
            Text("\(currencyWatchlistItemData.baseCurrencyCode)-\(currencyWatchlistItemData.targetCurrencyCode)")
                .padding(.leading, 10)
                .foregroundColor(.onSurface)
            
            Spacer()
            
            VStack {
                Spacer()
                
                Text("\(currencyWatchlistItemData.rate, specifier: "%.2f")")
                    .foregroundColor(.onSurface)
                
                HStack {
                    Image(systemName: currencyWatchlistItemData.changeRate < 0.0 ? "arrowtriangle.down.fill" : "arrowtriangle.up.fill")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(currencyWatchlistItemData.changeRate < 0.0 ? .colorArrowDown : .colorArrowUp)
                    
                    Text("\(currencyWatchlistItemData.changeRate, specifier: "%.2f")")
                        .foregroundColor(currencyWatchlistItemData.changeRate < 0.0 ? .colorArrowDown : .colorArrowUp)
                }
                .padding(6)
                .background(currencyWatchlistItemData.changeRate < 0.0 ? Color.colorDown : Color.colorUp)
                .cornerRadius(8)
                
                
                Spacer()
            }
            
            Spacer()
            
            Text(currencyWatchlistItemData.date)
                .padding(.trailing, 10)
                .foregroundColor(.onSurface)
        }
    }
}

struct CurrencyWatchlistItem_Previews: PreviewProvider {
	static var previews: some View {
		CurrencyWatchlistItem(
            currencyWatchlistItemData: CurrencyWatchlistItemData.sampleCurrencyWatchlistItemData,
            onDeleteAction: {
                print("Deleted")
            },
            onClick: {
                print("Clicked")
            }
		)
	}
}
