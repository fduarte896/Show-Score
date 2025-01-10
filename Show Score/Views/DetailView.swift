//
//  DetailView.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import SwiftUI

struct DetailView: View {
    
    let movie: MoviePopularDTO
    @Environment(\.modelContext) private var context
    
    var body: some View {
        
        VStack {
            
            Button {
                let movie = Movies(
                    id: movie.id,
                    title: movie.title,
                    overview: movie.overview,
                    releaseDate: movie.releaseDate,
                    posterPath: movie.posterPath,
                    voteAverage: movie.voteAverage
                )
                context.insert(movie)
            } label: {
                Text("Agrega a favoritos")
            }
            .buttonStyle(.borderedProminent)
            
            Image(systemName: "movieclapper")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            
            Text(movie.title)
                .font(.largeTitle)
            
            Text(movie.overview)
        }
        .padding(.horizontal)
    }
}

#Preview(traits: .sampleData) {
    DetailView(movie: .testMovieList)
}
