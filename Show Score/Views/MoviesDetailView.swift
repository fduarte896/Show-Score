//
//  MoviesDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI

struct MoviesDetailView: View {
    
    var movie : MovieModel
    var viewmodel : HomeViewModel?
    
    var body: some View {
        Text(String(movie.id))
        Text(movie.title).font(.title)
        Image(uiImage: movie.viewImage)
            .resizable()
            .scaledToFit()
            .frame(height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        Text(movie.releaseDate).font(.callout)
        Text(movie.overview)
//        Button("Add movie to Favourites"){
//            await viewmodel?.addFavoriteMovie(movieId: movie.id)
//        }
    }
    
}

#Preview {
    MoviesDetailView(movie: .movieSample)
}
