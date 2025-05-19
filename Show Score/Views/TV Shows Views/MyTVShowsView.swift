//
//  MyTVShowsView.swift
//  Show Score
//
//  Created by Felipe Duarte on 5/02/25.
//

import SwiftUI
import SwiftData

struct MyTVShowsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var favoriteTVShows: [FavoriteTVShowModel]
    
    var viewModel = TVShowsViewModel()
    
    @Binding var selectedTab: Int
    
    var body: some View {
        NavigationStack {
            if favoriteTVShows.isEmpty {
                VStack {
                    Image(systemName: "tv")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    
                    Text("You don't have any favorite TV shows yet.")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text("Explore and add some to your favorites.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        selectedTab = 0 // 🔹 Cambia a la pestaña de exploración
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
                        await viewModel.getFavouriteTVShows(sessionId: sessionID, modelContext: modelContext)
                        print(favoriteTVShows.count)
                    }
                }
            } else {
                List {
                    ForEach(favoriteTVShows) { favoriteTVShow in
                        NavigationLink(destination: TVShowsDetailView(tvShowId: favoriteTVShow.tvShow.id, viewModel: viewModel)) {
                            TVShowRowView(favorite: favoriteTVShow)
                        }
                        .swipeActions {
                            Button(role: .destructive) {
                                Task {
                                    if let sessionID = UserDefaults.standard.string(forKey: "sessionId") {
                                        await viewModel.deleteFavoriteTVShow(tvShowId: favoriteTVShow.tvShow.id, sessionID: sessionID, modelContext: modelContext)
                                        await viewModel.getFavouriteTVShows(sessionId: sessionID, modelContext: modelContext)
                                    }
                                }
                            } label: {
                                Label("Remove", systemImage: "trash")
                            }
                        }
                    }
                }
                .navigationTitle("My TV Shows")
                .task {
                    if let sessionID = UserDefaults.standard.string(forKey: "sessionId") {
                        await viewModel.getFavouriteTVShows(sessionId: sessionID, modelContext: modelContext)
                        print(favoriteTVShows.count)
                    }
                }
            }
        }
    }
}

// ✅ Nueva vista para cada fila de programa favorito
struct TVShowRowView: View {
    let favorite: FavoriteTVShowModel
    
    var body: some View {
        HStack {
            if let url = favorite.tvShow.urlToGetTVShowImage {
                AsyncImage(url: url) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 60, height: 90)
                .cornerRadius(8)
            }
            
            VStack(alignment: .leading) {
                Text(favorite.tvShow.name)
                    .font(.headline)
                
                Text("⭐ \(favorite.tvShow.voteAverage, specifier: "%.1f")")
                    .font(.subheadline)
                    .foregroundColor(.yellow)
                    .bold()
                
                Text(favorite.tvShow.firstAirDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
