//
//  WebViewContainer.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/13/24.
//

import SwiftUI

struct WebViewContainer: View {
    @Binding var articleURL: String
    @Binding var viewState: ViewState
    var body: some View {
        VStack{
            Button(action: {
                viewState = .articleList
            }, label: {
                HStack{
                    Text("<")
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                }
            })
            SwiftUIWebView(urlString: articleURL)
        }
    }
}

#Preview {
    WebViewContainer(articleURL: .constant("www.google.com"), viewState: .constant(.articleList))
}
