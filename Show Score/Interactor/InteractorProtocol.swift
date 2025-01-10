//
//  InteractorProtocol.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import Foundation


protocol InteractorProtocol {
    func fetchPopularMovies(popularType: AppendingPathPopular, page: Int) async throws -> [MoviePopularDTO]
}

struct Interactor: InteractorProtocol {
    func fetchPopularMovies(popularType: AppendingPathPopular, page: Int) async throws -> [MoviePopularDTO] {
        let (data, response) = try await URLSession.shared.data(for: .requestPopular(popularType: popularType, page: page))
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkErrors.httpError }
        if httpResponse.statusCode == 200 {
            do {
                let decoder = try JSONDecoder().decode(MovieListDTO.self, from: data).results
                return decoder
            } catch {
                throw NetworkErrors.jsonDecodingError(error)
            }
        } else {
            throw NetworkErrors.statusCode(httpResponse.statusCode)
        }
    }
}
