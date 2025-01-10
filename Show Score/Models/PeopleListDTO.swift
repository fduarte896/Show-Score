//
//  PeopleListDTO.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 9/01/25.
//

import Foundation

struct PeopleListDTO: Codable {
    let page: Int
    let results: [PersonDTO]
}

struct PersonDTO: Codable {
    let adult: Bool
    let gender: Int?
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let knownFor: [KnownForDTO]

    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

struct KnownForDTO: Codable {
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let overview: String
    let posterPath: String?
    let mediaType: String
    let adult: Bool
    let originalLanguage: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case id, title, overview, adult, popularity, video
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
