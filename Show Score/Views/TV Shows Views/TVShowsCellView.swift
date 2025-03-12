//
//  TVShowsCellView.swift
//  Show Score
//
//  Created by Felipe Duarte on 24/01/25.
//

import SwiftUI

struct TVShowsCellView: View {
    
    var tvShow : TVShowModel
    
    var body: some View {
        VStack{
            Image(uiImage: tvShow.viewImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(.rect(cornerRadius: 8))
            Text(tvShow.name)
            Text(String(tvShow.voteAverage))
        }
    }
}

//#Preview {
//    HomeView().modelContainer(MovieModel.preview)
//}
