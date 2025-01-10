//
//  TVShowListDTO.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 9/01/25.
//

import Foundation

struct TVShowListDTO: Codable {
    let page: Int
    let results: [TVShowDTO]
}

struct TVShowDTO: Codable {
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originCountry: [String]
    let originalLanguage: String
    let originalName: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let firstAirDate: String
    let name: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, name
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
