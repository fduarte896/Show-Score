//
//  TVShowsCellView.swift
//  Show Score
//
//  Created by Felipe Duarte on 24/01/25.
//

import SwiftUI

struct TVShowsCellView: View {
    var tvShow: TVShowModel
    @State private var isVisible = false // Controla la animación

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(uiImage: tvShow.viewImage)
                .resizable()
                .scaledToFill()
                .frame(width: 170, height: 260)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(tvShow.name)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Text("\(tvShow.voteAverage, specifier: "%.1f") ⭐")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 170)
        .opacity(isVisible ? 1 : 0) // Inicialmente invisible
        .offset(y: isVisible ? 0 : 20) // Comienza un poco más abajo
        .animation(.easeOut(duration: 0.5), value: isVisible)
        .onAppear {
            isVisible = true // Activa la animación cuando aparece en pantalla
        }
    }
}

//#Preview {
//    HomeView().modelContainer(MovieModel.preview)
//}
