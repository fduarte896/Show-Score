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

    @State private var selectedTab: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(viewModel: viewModel).tabItem {
                Label("Explore", systemImage: "magnifyingglass")
            }
            .tag(0)

            MyMoviesView(selectedTab: $selectedTab)
                .tabItem {
                    Label("My movies", systemImage: "popcorn")
            }
                .tag(1)
            MyTVShowsView(selectedTab: $selectedTab)
                .tabItem {
                    Label("My TV shows", systemImage: "tv")
                }
                .tag(2)
            SimpleLoginView()
                .tabItem {
                    Label("Login", systemImage: "person.circle")
                }
                .tag(3)
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
//
//#Preview {
//    MainView().modelContainer(MovieModel.preview)
//}
