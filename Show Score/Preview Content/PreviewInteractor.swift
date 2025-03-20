//
//  PreviewInteractor.swift
//  Show Score
//
//  Created by Felipe Duarte on 20/01/25.
//

import Foundation

//Vamos a hacer otro interactor, en este caso uno para obtener los datos de prueba y de esta manera podamos hacer maquetación de las vistas sin hacer llamados a red.

struct MovieInteractorPreview : MovieInteractorProtocol {
    func getPopularMovies() async throws -> [MovieModel] {
        let url = Bundle.main.url(forResource: "MovieDataPreview", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let popularMoviesResponsePreview = try decoder.decode(PopularMoviesResponseModelDecode.self, from: data)
        return popularMoviesResponsePreview.results.map { movieDecode in
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

extension HomeViewModel {
    static let previewVM = HomeViewModel(modelContext: nil, interactor: MovieInteractorPreview())
}
