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
                originalTitle: movieDecode.originalTitle ?? "Desconocido",
                overview: movieDecode.overview ?? "No hay descripción disponible",
                popularity: movieDecode.popularity ?? 0.0,
                posterPath: movieDecode.posterPath ?? "",
                backdropPath: movieDecode.backdropPath ?? "",
                releaseDate: movieDecode.releaseDate ?? "Fecha desconocida",
                voteAverage: movieDecode.voteAverage ?? 0.0,
                voteCount: movieDecode.voteCount ?? 0,
                genreIDs: movieDecode.genreIDs ?? [],
                adult: movieDecode.adult ?? false,
                video: movieDecode.video ?? false,
                isPopular: true
            )
        }
    }
}
