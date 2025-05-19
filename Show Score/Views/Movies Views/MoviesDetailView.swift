//
//  MoviesDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI
import SwiftData

struct MoviesDetailView: View {
    
    @State private var movie: MovieModel?
    var viewmodel: HomeViewModel?
    var movieID: Int
    var favoriteViewModel : FavoriteMoviesViewModel
    
    
    @Query private var favoriteMovies: [FavoriteMovieModel]
    
//    var isFavorite: Bool {
//        return favoriteMovies.contains { $0.movie.id == movieID }
//    }
    @State private var isFavorite: Bool = false
    @State private var animateButton = false
    
    var body: some View {
        ScrollView {
            VStack {
                if let movie = movie {
                    ZStack(alignment: .bottom) {
                        // Backdrop Image
                        AsyncImage(url: movie.urlToGetBackdropImage) { image in
                            image.resizable()
                                .scaledToFill()
//                                .frame(height: 250)
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .clipped()
                            
                        } placeholder: {
                            Color.gray.frame(height: 250)
                        }
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .center, endPoint: .bottom)
                        )
                        .ignoresSafeArea(edges: .top)

                        // Poster Image
                        AsyncImage(url: movie.urlToGetMovieImage) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 225)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 8)
                        } placeholder: {
                            Color.gray.frame(width: 150, height: 225)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 8)
                        }
                        .offset(y: 100)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(movie.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        HStack {
                            Label("\(movie.voteAverage, specifier: "%.1f")", systemImage: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(movie.voteCount) votos")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            if !movie.genreIDs.isEmpty {
                                ForEach(movie.genreIDs, id: \.self) { genre in
                                    Text(genreName(for: genre))
                                        .font(.caption)
                                        .padding(6)
                                        .background(Color.blue.opacity(0.2))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Label(movie.releaseDate, systemImage: "calendar")
                            Label("\(movie.popularity, specifier: "%.1f")", systemImage: "chart.bar.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                        .offset(y: -20)
                        
                        
                        Text("Sinopsis")
                            .font(.headline)
                            .offset(y: -20)
                        
                        Text(movie.overview)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .offset(y: -20)
                        
                        Button(action: {
                            Task {
                                if let sessionID = UserDefaults.standard.string(forKey: "sessionId") {
                                    withAnimation {
                                        animateButton = true
                                    }
                                    await favoriteViewModel.addFavoriteMovie(movieId: movie.id, sessionID: sessionID)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { // 🔹 Pequeño delay para transición visual
                                        withAnimation {
                                            isFavorite = true
                                            animateButton = false
                                        }
                                    }
                                }
                            }
                        }) {
                            HStack {
                                Image(systemName: "heart.fill")
                                    .scaleEffect(animateButton ? 1.4 : 1.0) // 🔹 Escalado suave
                                    .animation(.easeInOut(duration: 0.3), value: animateButton)
                                
                                Text(isFavorite ? "Added to Favorites" : "Add to Favorites")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(isFavorite ? Color.gray : Color.red) // 🔹 Cambio de color suave
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.top, 10)
                        .offset(y: -20)
                        .disabled(isFavorite) // 🔹 Evita que se presione varias veces
                    }
                    .padding()
                    .offset(y: 80)
                } else {
                    ProgressView("Cargando...")
                        .onAppear {
                            Task {
                                await fetchMovieDetails()
                            }
                        }
                }
            }
            .onAppear {
                isFavorite = favoriteMovies.contains { $0.movie.id == movieID }
            }
        }
    }

    func fetchMovieDetails() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)") else { return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            if let decodedMovie = try? decoder.decode(MovieModelDecode.self, from: data) {
                movie = decodedMovie.toMovieModel()
            } else {
                print("⚠️ No se pudo decodificar la respuesta de la API de traer los detalles de la película.")
                print("📋 Respuesta: \(String(decoding: data, as: UTF8.self))")
            }
        } catch {
            print("❌ Error fetching movie details: \(error)")
        }
    }

    func genreName(for id: Int) -> String {
        let genreDictionary: [Int: String] = [
            28: "Acción", 12: "Aventura", 16: "Animación",
            35: "Comedia", 80: "Crimen", 99: "Documental",
            18: "Drama", 10751: "Familia", 14: "Fantasía",
            36: "Historia", 27: "Terror", 10402: "Música",
            9648: "Misterio", 10749: "Romance", 878: "Ciencia Ficción",
            10770: "TV Movie", 53: "Suspenso", 10752: "Bélica", 37: "Western"
        ]
        return genreDictionary[id] ?? "Desconocido"
    }
}

//#Preview {
//    MoviesDetailView(movieID: 1064213)
//}

