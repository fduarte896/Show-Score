//
//  HomeView.swift
//  Show Score
//
//  Created by Felipe Duarte on 7/01/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var viewModel : HomeViewModel
    
    @State var orderAscending: Bool = true

    @Query(filter: #Predicate<MovieModel> { $0.isPopular == true }) var movies: [MovieModel]
    
    private var sortedMoviesByName: [MovieModel] {
        movies.sorted { movie1, movie2 in
            orderAscending ? movie1.title < movie2.title : movie1.title > movie2.title
        }
    }
    
    @Query var people: [PersonModel]
    
    private var sortedPeopleByName: [PersonModel] {
        people.sorted { person1, person2 in
            orderAscending ? person1.name < person2.name : person1.name > person2.name
        }
    }
//    @Query var tvShows: [TVShowModel]
    @Query(filter: #Predicate<TVShowModel> { $0.isPopular == true} ) var tvShows: [TVShowModel]
 
    private var sortedTVShowsByName: [TVShowModel] {
        tvShows.sorted { tvShow1, tvShow2 in
            orderAscending ? tvShow1.name < tvShow2.name : tvShow1.name > tvShow2.name
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Popular Movies") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sortedMoviesByName) { movie in
                                NavigationLink(value: movie) {
                                    MoviesCellView(movie: movie)
                                }
                            }
                        }
                    }
                }

                Section("Popular People") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sortedPeopleByName) { person in
                                NavigationLink(value: person){
                                    PeopleCellView(person: person)
                                }
                            }
                        }
                    }
                }

                Section("Popular TV Shows") {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(sortedTVShowsByName) { tvShow in
                                NavigationLink(value: tvShow){
                                    TVShowsCellView(tvShow: tvShow)
                                }
                            }
                        }
                    }
                }
            }
            

            .navigationDestination(for: MovieModel.self, destination: { movie in
                MoviesDetailView(movie: movie)
            })
            .navigationDestination(for: TVShowModel.self, destination: { tvShow in
                TVShowsDetailView(tvShow: tvShow)
            })
            .navigationDestination(for: PersonModel.self, destination: { person in
                PersonDetailView(person: person)
            })
            
            .toolbar {
                ToolbarItemGroup {
                    Button(action: {
                        Task {
                            await viewModel.importMovies()
                        }
                    }) {
                        Label("Import Movies", systemImage: "movieclapper")
                    }

                    Button(action: {
                        Task {
                            await viewModel.importTVShows()
                        }
                    }) {
                        Label("Import TV Shows", systemImage: "tv")
                    }

                    Button(action: {
                        Task {
                            await viewModel.importPeople()
                        }
                    }) {
                        Label("Import People", systemImage: "person")
                    }

                    Button(action: {
                        for movie in movies {
                            modelContext.delete(movie)
                            try! modelContext.save()
                        }
                        for person in people {
                            modelContext.delete(person)
                        }
                        for tvShow in tvShows {
                            modelContext.delete(tvShow)
                        }
                    }) {
                        Label("Delete All", systemImage: "minus.circle.fill")
                    }
                }
            }
        }
        
    }
    
}



//#Preview {
//    HomeView()
//        .modelContainer(MovieModel.preview)
//
//}

