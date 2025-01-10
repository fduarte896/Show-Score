//
//  CellView.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import SwiftUI

struct CellView: View {
    
    let movie: MoviePopularDTO
    
    var body: some View {
        HStack {
            Image(systemName: "movieclapper")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
            
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                Text("**Release date**:\(movie.releaseDate)")
                Text("**Popularity**:\(movie.popularity)")
                Text("**Votes**:\(movie.voteCount)")
            }
            .padding()
        }
    }
}

#Preview {
    CellView(movie: .testMovieList)
}
