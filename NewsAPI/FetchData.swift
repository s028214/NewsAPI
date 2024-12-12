//
//  FetchData.swift
//  NewsAPI
//
//  Created by Mason Zhu (student LM) on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "//FILL IN"
        
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
}

extension Article: Identifiable {
    var id: String {title ?? ""}
}
