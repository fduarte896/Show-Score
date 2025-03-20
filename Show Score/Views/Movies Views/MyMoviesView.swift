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
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationStack {
            if favoriteMovies.isEmpty  {

                VStack {
                    Image(systemName: "film")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    
                    Text("You don't have any favorite movies yet.")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text("Explore and add some to your favorites.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        // Acción para ir a explorar películas (si tienes una sección de exploración)
                        selectedTab = 0
                    }) {
                        Text("Go to explore")
                            .bold()
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .task {
                    if let sessionID = UserDefaults.standard.string(forKey: "sessionId"){
                        await getFavouriteMovies(sessionId: sessionID, modelContext: modelContext)
                        print(favoriteMovies.count)
                    }
                }
            }  else {
                List {
                    ForEach(favoriteMovies) { favoriteMovie in
                        NavigationLink(destination: MoviesDetailView(movieID: favoriteMovie.movie.id)){
                            MovieRowView(favorite: favoriteMovie)
                        }
                            .swipeActions {
                                Button(role: .destructive) {
                                    Task {
                                        if let sessionID = UserDefaults.standard.string(forKey: "sessionId"){
                                            await deleteFavoriteMovie(movieId: favoriteMovie.movie.id, sessionID: sessionID, modelContext: modelContext)
                                            await getFavouriteMovies(sessionId: sessionID, modelContext: modelContext)
                                        }
                                    }
                                } label: {
                                    Label("Eliminar", systemImage: "trash")
                                }
                            }
                    }
                    
                    
                }
                
                .navigationTitle(Text("My Movies"))
                .task {
                    if let sessionID = UserDefaults.standard.string(forKey: "sessionId"){
                        await getFavouriteMovies(sessionId: sessionID, modelContext: modelContext)
                        print(favoriteMovies.count)
                    }
                }
            }
        }
    }
    
    struct MovieRowView: View {
        let favorite: FavoriteMovieModel
        
        var body: some View {
            HStack {
                if let url = favorite.movie.urlToGetMovieImage {
                    AsyncImage(url: url) { image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 90)
                    .cornerRadius(8)
                }
                
                VStack(alignment: .leading) {
                    Text(favorite.movie.title)
                        .font(.headline)
                    
                    Text("⭐ \(favorite.movie.voteAverage, specifier: "%.1f")")
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                        .bold()
                    
                    Text(favorite.movie.releaseDate)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.vertical, 8)
        }
    }
}

//#Preview {
//    MyMoviesView()
//}
