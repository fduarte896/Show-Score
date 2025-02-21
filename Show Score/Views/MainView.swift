//
//  MainView.swift
//  Show Score
//
//  Created by Felipe Duarte on 5/02/25.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.modelContext) var modelContext
    //Inicializamos el viewmodel sin un modelcontext porque si lo usáramos inmediatemente entonces tendríamos un error. Entonces es en el onAppear que vamos a asignar ese modelContext al viewmodel porque es cuando la vista aparece en pantalla que puede acceder al modelContext, antes no.
    @StateObject private var viewModel = HomeViewModel(modelContext: nil)
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel).tabItem {
                Label("Home", systemImage: "house")
            }
            MyMoviesView()
                .tabItem {
                    Label("My movies", systemImage: "popcorn")
            }
            MyTVShowsView()
                .tabItem {
                    Label("My TV shows", systemImage: "tv")
                }
            SimpleLoginView()
                .tabItem {
                    Label("Login", systemImage: "person.circle")
                }
        }
        .onAppear {
            viewModel.modelContext = modelContext
   
            Task {
                
                await viewModel.importMovies()
                await viewModel.importTVShows()
                await viewModel.importPeople()
                
            }
        }

    }
}

#Preview {
    MainView().modelContainer(MovieModel.preview)
}
