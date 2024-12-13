//
//  ArticleListView.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/13/24.
//

import SwiftUI

struct ArticleListView: View {
    @Binding var articleURL: String
    @Binding var viewState: ViewState
    @State var data: FetchData = FetchData()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.backgroundGray)
                .edgesIgnoringSafeArea(.all)
          
            VStack{
                ScrollView{
                    ForEach(data.response.articles) { a in
                        Button(action: { // TODO
                            articleURL = a.url ?? "www.google.com"
                            viewState = .webView
                        }, label: {
                            VStack {
                                VStack (alignment: .center, content: {
                                    Text(a.title ?? "")
                                        .font(.title)
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Text(a.author ?? "")
                                        .font(.subheadline)
                                       
                                    Text(a.description ?? "")
                                        .font(.title2)
                                    
                                    AsyncImage(url: a.urlToImage){
                                        phase in
                                        switch phase {
                                        case.failure:
                                            Image("fnf")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(10)
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: 200)
                                                .cornerRadius(10)
                                        default:
                                            ProgressView()
                                        }
                                    }
                                   
                                })
                                .foregroundColor(Color.white)
                                .padding(.all)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                                
                                Rectangle()
                                    .fill(Color(red: 251 / 255.0, green: 170 / 255.0, blue: 105 / 255.0))
                                    .frame(width: 75, height: 4)
                                    .padding(.horizontal, 10)
                            }
                            
                        })
                        

                    }
                }
                /*
                VStack {
                    Text("Total Results: \(data.response.totalResults)")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                }
                 */
            }.task {
                await data.getData()
            }
        }
    }
}

#Preview {
    ArticleListView(articleURL: .constant("www.google.com"), viewState: .constant(.articleList))
}
