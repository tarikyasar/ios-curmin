//
//  ContentView.swift
//  Curmin
//
//  Created by Tarik Yasar on 16.09.2022.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                AF.request("https://httpbin.org/get").response { response in
                    print(response)
                }
            }) {
                Text("Click me")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
