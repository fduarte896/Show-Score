//
//  MyMoviesView.swift
//  Show Score
//
//  Created by Felipe Duarte on 5/02/25.
//

import SwiftUI
import SwiftData

struct MyMoviesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteMovies: [FavoriteMovieModel]

    var body: some View {
        NavigationView {
            List(favoriteMovies) { favorite in
                HStack {
                    if let url = favorite.movie.urlToGetMovieImage {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(favorite.movie.title)
                            .font(.headline)
                        Text(favorite.movie.releaseDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Películas Favoritas")
            .task {
//                await getFavouriteMovies(sessionId: "tu_session_id", modelContext: modelContext)
            }
        }
    }
}

#Preview {
    MyMoviesView()
}
