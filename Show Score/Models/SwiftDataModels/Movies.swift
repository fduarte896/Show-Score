//
//  Peliculas.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import Foundation
import SwiftData

// Julio: 43:48, si quiero cargar cosas de una APIRest a la BD debo definir otro modelo sobre el DTO de la API

import SwiftData

@Model
class Movies {
    @Attribute(.unique) var id: Int
    var title: String
    var overview: String
    var releaseDate: String
    var posterPath: String?
    var voteAverage: Double

    init(id: Int, title: String, overview: String, releaseDate: String, posterPath: String?, voteAverage: Double) {
        self.id = id
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterPath = posterPath
        self.voteAverage = voteAverage
    }
}
