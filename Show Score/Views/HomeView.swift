//
//  HomeView.swift
//  Show Score
//
//  Created by Felipe Duarte on 7/01/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    //Hacer el sorting con el puntaje!
    @Query private var movies: [MovieModel]
    @Query private var people: [PersonModel]
    @Query private var tvShows: [TVShowModel]
    

    var body: some View {
        
        NavigationStack {
            List {
                Section("Popular Movies"){
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(movies) { movie in
                                CellView(movie: movie)
                                
                            }
                            
                        }
                        
                    }
                    
                }
            }
                List{
                    Section("Popular People"){

                        ScrollView(.horizontal){
                            HStack{
                                
                                ForEach(people) { person in
                                    Text(person.name)
                                    
                                }
                        }
                        }
                    }
                }
                
            List{
                    Section("Popular TV Shows"){

                        ScrollView(.horizontal){
                            HStack{
                                
                                ForEach(tvShows) { tvShow in
                                    Text(tvShow.originalName)
                                    
                                }
                        }
                        }
                    }
                }
            .onAppear {
                let container = modelContext.container
           
                
                Task.detached {
                    let backgroundActor = MovieModel.BackgroundActor(modelContainer: container)
                    let backgroundActor2 = TVShowModel.BackgroundActor(modelContainer: container)
                    let backgroundActor3 = PersonModel.BackgroundActor(modelContainer: container)
                    
                    await print(movies.count)
                    
                    do {
                        try await backgroundActor.importMovies()
                        try await backgroundActor2.importTVShows()
                        try await backgroundActor3.importPeople()
                    } catch {
                        print("Error importing movies: \(error)")
                    }
                }
                
            }

            .toolbar {
                Button("", systemImage: "movieclapper") {
                    let container = modelContext.container
                    
                    Task.detached {
                        let backgroundActor = MovieModel.BackgroundActor(modelContainer: container)
                        await print(movies.count)
                        
                        do {
                            try await backgroundActor.importMovies()
                        } catch {
                            print("Error importing movies: \(error)")
                        }
                    }
                }

                Button("", systemImage: "tv"){
                    let container = modelContext.container
                    
                    Task.detached {
                        let backgroundActor = TVShowModel.BackgroundActor(modelContainer: container)
                        do {
                            try await backgroundActor.importTVShows()
                        } catch {
                            print("Error importing popular people: \(error)")
                        }
                    }
                }
                
                Button("", systemImage: "person"){
                    let container = modelContext.container
                    
                    Task.detached {
                        let backgroundActor = PersonModel.BackgroundActor(modelContainer: container)
                        do {
                            try await backgroundActor.importPeople()
                        } catch {
                            print("Error importing popular people: \(error)")
                        }
                    }
                }
                
                Button("", systemImage: "minus.circle.fill") {
                    for movie in movies {
                        modelContext.delete(movie)
                        
                    }
                    for person in people {
                        modelContext.delete(person)
                    }
                    for tvShow in tvShows {
                        modelContext.delete(tvShow)
                    }
                }
                


            }
        }
    }
}

#Preview {
    HomeView().modelContainer(for: [MovieModel.self, PersonModel.self, TVShowModel.self])
}
