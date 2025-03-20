//
//  CarouselView.swift
//  Show Score
//
//  Created by Felipe Duarte on 12/03/25.
//

import SwiftUI

struct CarouselView: View {
    let items: [MovieModel]
    
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect() // Auto-scroll cada 4s
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(items.prefix(5).indices, id: \.self) { index in
                NavigationLink(destination: MoviesDetailView(movieID: items[index].id)){
                    ZStack(alignment: .bottom) {
                        AsyncImage(url: items[index].urlToGetBackdropImage) { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 300)
                                .clipped()
                        } placeholder: {
                            // Si no hay backdrop, usamos el poster
                            AsyncImage(url: items[index].urlToGetMovieImage) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, maxHeight: 300)
                                    .clipped()
                            } placeholder: {
                                // Si tampoco hay poster, usamos un color de fondo
                                Rectangle().fill(Color.gray.opacity(0.3))
                                    .frame(height: 300)
                            }
                        }

                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.9)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .frame(height: 120)
                        .frame(maxWidth: .infinity, alignment: .bottom)

                        VStack(alignment: .leading, spacing: 8) {
                            Text(items[index].title)
                                .font(.title2.bold())
                                .foregroundColor(.white)
                                .shadow(radius: 5)
                                .padding(.horizontal)

                            .padding(.bottom, 16)
                            .padding(.horizontal)
                        }
                    }
                    .tag(index)
                }
            }
        }
        .tabViewStyle(.page)
        .frame(height: 320)
        .onReceive(timer) { _ in
            withAnimation {
                guard !items.isEmpty else { return } // Evitar el error cuando no hay datos
                currentIndex = (currentIndex + 1) % items.prefix(5).count
            }
        }
    }
}
