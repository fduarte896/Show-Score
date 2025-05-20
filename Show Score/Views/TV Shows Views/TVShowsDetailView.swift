//
//  TVShowsDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI
import SwiftData

struct TVShowsDetailView: View {
    
    @State private var tvShow : TVShowModel?
    var tvShowId : Int
    
    @Query private var favoriteTVShows : [FavoriteTVShowModel]
    
    var viewModel : TVShowsViewModel
    
    private var apiKey: String {
        Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
    }
    @State private var isFavorite : Bool = false
    @State private var animateButton : Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                if let tvShow = tvShow {
                    ZStack(alignment: .bottom) {
                        // Backdrop Image
                        AsyncImage(url: tvShow.urlToGetBackdropImage) { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(height: 250)
                                .clipped()
                        } placeholder: {
                            Color.gray.frame(height: 250)
                        }
                        .overlay(
                            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.8)]), startPoint: .center, endPoint: .bottom)
                        )
                        
                        // Poster Image
                        AsyncImage(url: tvShow.urlToGetTVShowImage) { image in
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
                        Text(tvShow.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        HStack {
                            Label("\(tvShow.voteAverage, specifier: "%.1f")", systemImage: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(tvShow.voteCount) votos")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Label(tvShow.firstAirDate, systemImage: "calendar")
                            Label("\(tvShow.popularity, specifier: "%.1f")", systemImage: "chart.bar.fill")
                        }
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        
                        Text("Sinopsis")
                            .font(.headline)
                        
                        Text(tvShow.overview)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                        
                        Button(action: {
                            Task {
                                if let sessionID = UserDefaults.standard.string(forKey: "sessionId") {
                                    withAnimation {
                                        animateButton = true
                                    }
                                    await viewModel.addFavoriteTVShow(tvShowId: tvShowId, sessionID: sessionID)
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

                        
                    }
                    .padding()
                    .offset(y: 80)
                } else {
                    ProgressView("Cargando...")
                        .onAppear {
                            Task {
                                await fetchTVShowDetails()
                            }
                        }
                }
            } .onAppear {
                isFavorite = favoriteTVShows.contains { $0.tvShow.id == tvShowId }
            }
        }
    }
    
    func fetchTVShowDetails() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/tv/\(tvShowId)") else { return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = URLRequest(url: components.url!)
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer \(apiKey)"
        ]
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            if let decodedTVShow = try? decoder.decode(TVShowModelDecode.self, from: data) {
                tvShow = decodedTVShow.toTVShowModel()
                
            } else {
                print("⚠️ No se pudo decodificar la respuesta de la API.")
                print("📋 Respuesta: \(String(decoding: data, as: UTF8.self))")

            }
        } catch {
            print("❌ Error fetching TV Shows details: \(error)")
        }
    }
}
