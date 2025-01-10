//
//  ViewModel.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import Foundation

@Observable
class ViewModel {
    let interactor: InteractorProtocol
    
    var popularMovies:[MoviePopularDTO] = []
    var page = 1
    var showAlert = false
    var errorMessage = ""
    
    init(interactor: InteractorProtocol = Interactor()) {
        self.interactor = interactor
//        getPopularMovies()
    }
    
    @MainActor
    func getPopularMovies() {
        Task {
            do {
                let movies = try await interactor.fetchPopularMovies(popularType: .movie, page: page)

                
                self.popularMovies += movies
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
