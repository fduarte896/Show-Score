import SwiftUI

struct MainView: View {
    @Environment(\.modelContext) var modelContext

    @StateObject private var viewModel = HomeViewModel(modelContext: nil)
    @EnvironmentObject var loginViewModel: LoginViewModel

    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(viewModel: viewModel)
                .tabItem {
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

            // 💡 Definir qué pasa cuando se loguea correctamente
            loginViewModel.onLoginSuccess = {
                selectedTab = 0 // Redirigir a Explore
            }

            // Cargar datos iniciales
            Task {
                await viewModel.importMovies()
                await viewModel.importTVShows()
                await viewModel.importPeople()
            }
        }
    }
}
