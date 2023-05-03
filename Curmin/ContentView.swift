//
//  ContentView.swift
//  Curmin
//
//  Created by Tarik Yasar on 16.09.2022.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = SymbolListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack {
                    if (viewModel.symbols != nil) {
                        List(viewModel.symbols!, id: \.self) { symbol in
                            Text("\(symbol.code): \(symbol.name)")
                        }
                    }
                }
                
                if (viewModel.isLoading) {
                    ProgressView()
                }
            }
            .navigationTitle("Symbols")
        }
        .onAppear {
            viewModel.getSymbols()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
