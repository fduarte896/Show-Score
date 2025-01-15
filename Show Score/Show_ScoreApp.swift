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
    var body: some Scene {
        WindowGroup {
            HomeView().modelContainer(for: [PopularMoviesResponseModel.self, MovieModel.self, TVShowModel.self, PersonModel.self], inMemory: false, isUndoEnabled: true)
        }
    }
}
