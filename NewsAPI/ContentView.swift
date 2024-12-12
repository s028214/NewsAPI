//
//  ContentView.swift
//  NewsAPI
//
//  Created by Mason Z. (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var data = FetchData()

    
    var body: some View {
        ZStack {
            /*
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.3))
                .edgesIgnoringSafeArea(.all)
             */
            VStack{
                ScrollView{
                    ForEach(data.response.articles) {
                        a in
                        VStack (alignment: .leading, content: {
                            Text(a.title ?? "[NO TITLE]")
                                .font(.title)
                                .bold()
                            
                            Spacer()
                            
                            Text(a.author ?? "N/A")
                                .font(.subheadline)
                            
                               
                            Text(a.description ?? "[N/A]")
                                .font(.title2)
                           
                        }) .padding(.all)
                    }
                }
                VStack {
                    Text("Total Results: \(data.response.totalResults)")
                        .font(.title)
                }.bold()
                .task{
                    await data.getData()
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
 
