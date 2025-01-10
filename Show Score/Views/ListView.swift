//
//  ListView.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import SwiftUI

struct ListView: View {
    
    @State var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.popularMovies) { movie in
                NavigationLink(value: movie) {
                    CellView(movie: movie)
                }
            }
            .navigationDestination(for: MoviePopularDTO.self) { movie  in
                DetailView(movie: movie)
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.getPopularMovies()
        }
        .alert("Error", isPresented: $viewModel.showAlert) {
            
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
}
