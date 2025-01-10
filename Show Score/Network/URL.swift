//
//  URL.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 9/01/25.
//

import Foundation

enum AppendingPathPopular: String {
    case tv
    case person
    case movie
}

let apiURL = URL(string: "https://api.themoviedb.org/3")!
// https://api.themoviedb.org/3/tv/popular
// https://api.themoviedb.org/3/person/popular
// https://api.themoviedb.org/3/movie/popular

extension URL {
    static func urlPopular(popularType: AppendingPathPopular, page: Int) -> URL {
        let path: String = switch popularType {
        case .movie: 
            "movie/popular"
        case .tv:
            "tv/popular"
        case .person:
            "person/popular"
        }
        let url = apiURL.appending(path: path)
            .appending(queryItems: [.queryPage(page: page), .queryLanguage()])
        print(url)
        return url
          
    }
}

extension URLQueryItem {
    static func queryPage(page: Int) -> URLQueryItem {
        URLQueryItem(name: "page", value: "\(page)")
    }
    
    static func queryLanguage() -> URLQueryItem {
        .init(name: "language", value: "en-US")
    }
}

extension URLRequest {
    static func requestPopular(popularType: AppendingPathPopular, page: Int) -> URLRequest {
        var urlRequest = URLRequest(url: .urlPopular(popularType: popularType, page: page))
        urlRequest.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZjhhNDcxNjI0YjcyMmNjN2UyY2Q3ZTc3YTQ0OTI1ZCIsIm5iZiI6MTcxNjYzNTQzMi4zMDgsInN1YiI6IjY2NTFjNzI4ZWU4MmI0NWViMjI2ZWQ5MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qCrKDZJ60d2FWkJ-nPLSRGMaSB_mN4PhPWBFmMh6HLY", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "accept")
        print(urlRequest)
        return urlRequest
    }
}
