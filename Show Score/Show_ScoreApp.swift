//
//  Show_ScoreApp.swift
//  Show Score
//
//  Created by Felipe Duarte on 7/01/25.
//

import SwiftUI
import SwiftData

@main
struct Show_ScoreApp: App {
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            //            SimpleLoginView()
            //                .modelContainer(for: [PopularMoviesResponseModel.self, MovieModel.self, TVShowModel.self, PersonModel.self], inMemory: false, isUndoEnabled: true)
            MainView()
                .environmentObject(loginViewModel)
                .onOpenURL(perform: { url in
                    print("📬 Recibido deeplink: \(url.absoluteString)")
                    
                    if url.absoluteString == "showscoreapp://loginsuccessful" {
                        Task {
                            await loginViewModel.createSessionId()
                        }
                    }
                })
                .modelContainer(for: [PopularMoviesResponseModel.self, MovieModel.self, TVShowModel.self, PersonModel.self, FavoriteMovieModel.self, FavoriteTVShowModel.self], inMemory: false, isUndoEnabled: true)
        }
    }
}
