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
    
    var body: some View {
        NavigationView {
            List(favoriteTVShows) { favoriteTVShows in
                HStack {
                    if let url = favoriteTVShows.tvShow.urlToGetTVShowImage {
                        AsyncImage(url: url) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 75)
                        .cornerRadius(8)
                    }
                    VStack(alignment: .leading) {
                        Text(favoriteTVShows.tvShow.name)
                            .font(.headline)
                        Text(favoriteTVShows.tvShow.firstAirDate)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            .navigationTitle("My TV Shows")
            .task {
//                await getFavouriteTVShows(sessionId: "tu_session_id", modelContext: modelContext)
            }
        }
    }
       
}

#Preview {
    MyTVShowsView()
}
