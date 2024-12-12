//
//  ContentView.swift
//  NewsAPI
//
//  Created by Mason Z. (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    
    var body: some View {
        VStack {
            Text(json)
        } .task{
            let url = URL(string: "https://newsapi.org/v2/everything?q=ukraine&from=2024-12-00&language=en&apiKey=9462521701f04833815aaf2d09f76bcb")!

              let (data, _) = try! await URLSession.shared.data(from: url)
           
              print(String(decoding: data, as: UTF8.self))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
