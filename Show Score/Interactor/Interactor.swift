//
//  Interactor.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

//El protocolo es como las reglas a las que se tienen que someter quienes se conforman a ellas. Sin embargo, las funciones que estén dentro de una extensión de un protocolo si van a estar definidas y no van a ser flexibles o definibles por las estructuras que se decidan conformar al protocolo.
protocol MovieInteractorProtocol {
    func getPopularMovies() async throws -> [MovieModel]
}

//El interactor es quien hace
//struct MovieInteractor : MovieInteractorProtocol {
//    
//    func getPopularMovies() async throws -> [MovieModel] {
//        try await getModelFromJSON(request: .getRequest(url: .popularMovies), type: PopularMoviesResponseModelDecode.self).results.map(
//    }
//}

struct MovieInteractor: MovieInteractorProtocol {
    func getPopularMovies() async throws -> [MovieModel] {
        // Obtén el modelo decodificado de la respuesta
        let popularMoviesResponse = try await getModelFromJSON(
            request: .getRequest(url: .popularMovies),
            type: PopularMoviesResponseModelDecode.self
        )
        
        // Mapea los `MovieModelDecode` a `MovieModel`
        return popularMoviesResponse.results.map { movieDecode in
            MovieModel(
                id: movieDecode.id,
                title: movieDecode.title,
                originalTitle: movieDecode.originalTitle,
                overview: movieDecode.overview,
                popularity: movieDecode.popularity,
                posterPath: movieDecode.posterPath,
                posterImage: movieDecode.posterImage,
                backdropPath: movieDecode.backdropPath,
                releaseDate: movieDecode.releaseDate,
                voteAverage: movieDecode.voteAverage,
                voteCount: movieDecode.voteCount,
                genreIDs: movieDecode.genreIDs,
                adult: movieDecode.adult,
                video: movieDecode.video,
                isPopular: true
            )
        }
    }
}
