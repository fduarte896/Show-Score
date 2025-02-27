//
//  TVShowsDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI

struct TVShowsDetailView: View {
    var tvShow : TVShowModel
    var body: some View {
        Text(String(tvShow.id))
        Text(tvShow.name)
            .font(.title)
        Image(uiImage: tvShow.viewImage)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(tvShow.overview)
            .bold()
        Button("Add TV Show to Favorites") {
            Task {
                if let sessionID = globalSessionID {
                    await addFavoriteTVShow(tvShowId: tvShow.id, sessionID: sessionID)
                }
            }
        }
    }
}

#Preview {
    TVShowsDetailView(tvShow: .tvShowSample)
}
