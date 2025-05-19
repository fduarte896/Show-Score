import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    
    @StateObject var viewModel: HomeViewModel // ✅ Aseguramos que sea observado
    @StateObject var moviesFavViewModel = FavoriteMoviesViewModel()
    @StateObject var tvShowsFavViewModel = TVShowsViewModel()
    
    @State var orderAscending: Bool = true
    
    @Query(filter: #Predicate<MovieModel> { $0.isPopular == true }) var movies: [MovieModel]
    
    private var sortedMoviesByName: [MovieModel] {
        movies.sorted { movie1, movie2 in
            orderAscending ? movie1.voteAverage > movie2.voteAverage : movie1.voteAverage < movie2.voteAverage
        }
    }
    
    @Query var people: [PersonModel]

    private var sortedPeopleByName: [PersonModel] {
        people
            .filter {
                ($0.profilePath ?? "").isEmpty == false && // Filtra personas con `profilePath` válido
                $0.knownForDepartment.lowercased() == "acting" // Filtra solo actores
            }
            .sorted { person1, person2 in
                orderAscending ? person1.name < person2.name : person1.name > person2.name
            }
    }



    @Query(filter: #Predicate<TVShowModel> { $0.isPopular == true} ) var tvShows: [TVShowModel]
    
    private var sortedTVShowsByName: [TVShowModel] {
        tvShows.sorted { tvShow1, tvShow2 in
            orderAscending ? tvShow1.voteAverage > tvShow2.voteAverage : tvShow1.voteAverage < tvShow2.voteAverage
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.searchedText.isEmpty {
                    if viewModel.searchResults.isEmpty {
                        Text("No results found")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List(viewModel.searchResults, id: \.id) { result in
                            NavigationLink(value: result) {
                                SearchResultCellView(result: result)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                } else {
                    ScrollView {
                        CarouselView(items: movies, viewModel: moviesFavViewModel)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("🎬 Popular Movies")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), spacing: 12) {
                                ForEach(sortedMoviesByName.indices, id: \.self) { index in
                                    NavigationLink(value: sortedMoviesByName[index]) {
                                        MoviesCellView(movie: sortedMoviesByName[index])
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            
                            Text("📺 Popular TV Shows")
                                .font(.title2.bold())
                                .foregroundColor(.primary)
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 2), spacing: 12) {
                                ForEach(sortedTVShowsByName.indices, id: \.self) { index in
                                    NavigationLink(value: sortedTVShowsByName[index]) {
                                        TVShowsCellView(tvShow: sortedTVShowsByName[index])
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            
                            Text("Actores Destacados")
                                .font(.headline)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(sortedPeopleByName) { person in
                                        NavigationLink(value: person){
                                            PeopleCellView(person: person)
                                                .frame(width: 130, height: 170)
                                                .cornerRadius(10)
                                                .shadow(radius: 3)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationTitle(Text("Explore"))
            .searchable(text: $viewModel.searchedText, prompt: "Search TV Shows and Movies")
            .onChange(of: viewModel.searchedText) { newValue, oldValue in
                Task {
                    await viewModel.fetchSearchResults(query: newValue)
                    print("🔍 searchResults en HomeView: \(viewModel.searchResults.count) elementos")
                }
            }
            
            .navigationDestination(for: MovieModel.self, destination: { movie in
                MoviesDetailView(movieID: movie.id, favoriteViewModel: moviesFavViewModel)
            })
            .navigationDestination(for: TVShowModel.self, destination: { tvShow in
                TVShowsDetailView(tvShowId: tvShow.id, viewModel: tvShowsFavViewModel)
            })
            .navigationDestination(for: PersonModel.self, destination: { person in
                PersonDetailView(personID: person.id)
            })
            .navigationDestination(for: SearchResult.self, destination: { result in
                switch result.mediaType {
                case .movie:
                    MoviesDetailView(movieID: result.id, favoriteViewModel: moviesFavViewModel)
                case .tv:
                    TVShowsDetailView(tvShowId: result.id, viewModel: tvShowsFavViewModel)
                case .person:
//                    MoviesDetailView(movieID: result.id)
                    PersonDetailView(personID: result.id)
                }
            })
        }
    }
}
