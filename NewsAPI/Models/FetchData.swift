//
//  FetchData.swift
//  NewsAPI
//
//  Created by Mason Z. on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://newsapi.org/v2/everything?q=ukraine&from=2024-12-00&language=en&apiKey=9462521701f04833815aaf2d09f76bcb"
        
        guard let url = URL(string: URLString) else {return}
        
        let(data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data) // decoded JSON
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable {
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable {
    var title: String? 
    var author: String?
    var description: String?
    var url: String? 
    var urlToImage: URL?
}

extension Article: Identifiable {
    var id: String {title ?? ""}
}
