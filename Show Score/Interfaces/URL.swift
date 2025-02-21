//
//  URL.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

let URLbase: URL = URL(string: "https://api.themoviedb.org/3")!

extension URL {
    static let popularMovies = URLbase
        .appending(path: "movie/popular")
}
