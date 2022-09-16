//
//  ContentView.swift
//  Curmin
//
//  Created by Tarik Yasar on 16.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(systemName: "dollarsign.circle")
                .imageScale(.large)
                .foregroundColor(.accentColor)
			
            Text("Curmin")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
