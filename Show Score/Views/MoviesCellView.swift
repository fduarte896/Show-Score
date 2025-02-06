//
//  CellView.swift
//  Show Score
//
//  Created by Felipe Duarte on 14/01/25.
//

import SwiftUI

struct MoviesCellView: View {
    var movie : MovieModel
    
    var body: some View {
        VStack{
            Image(uiImage: movie.viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 8))

            Text(movie.title)
            Text(String(movie.voteAverage))
        }
    }
}

//#Preview {
//    HomeView().modelContainer(for: [MovieModel.self, PersonModel.self, TVShowModel.self])
//}
