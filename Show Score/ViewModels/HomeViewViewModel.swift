import SwiftData
import Foundation
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    var modelContext: ModelContext?
    private let interactor : MovieInteractorProtocol
    
    @Published var searchedText: String = ""
    @Published var searchResults: [SearchResult] = []

    init(modelContext: ModelContext?, interactor: MovieInteractorProtocol = MovieInteractorPreview()) {
        self.modelContext = modelContext
        self.interactor = interactor
    
    }
    
    private var apiKey: String {
        Bundle.main.infoDictionary?["TMDB_API_KEY"] as? String ?? ""
    }

    func fetchSearchResults(query: String) async {
        guard !query.isEmpty else {
            searchResults = []
            return
        }
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/multi") else {
            return
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "include_adult", value: "false"),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                let decodedResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
                searchResults = decodedResponse.results
                print("✅ Resultados obtenidos: \(decodedResponse.results.count)")

            } else {
                print("⚠️ Error en la respuesta: \(response)")
            }
        } catch {
            print("❌ Error fetching search results: \(error.localizedDescription)")
        }

    }

    func importMovies() async {
        
        guard let modelContext = modelContext else { return }
        print("Movies imported successfully!")
        let backgroundActor = MovieModel.BackgroundActor(modelContainer: modelContext.container)
        do {
            try await backgroundActor.importMovies()
            
        } catch {
            print("Error importing movies: \(error)")
        }
    }

    func importTVShows() async {
        guard let modelContext = modelContext else { return }
        let backgroundActor = TVShowModel.BackgroundActor(modelContainer: modelContext.container)
        do {
            try await backgroundActor.importTVShows()
        } catch {
            print("Error importing TV shows: \(error)")
        }
    }

    func importPeople() async {
        guard let modelContext = modelContext else { return }
        let backgroundActor = PersonModel.BackgroundActor(modelContainer: modelContext.container)
        do {
            try await backgroundActor.importPeople()
        } catch {
            print("Error importing people: \(error)")
        }
    }
    


}


