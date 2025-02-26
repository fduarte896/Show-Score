import SwiftData
import Foundation
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    var modelContext: ModelContext?
    private let interactor : MovieInteractorProtocol

    init(modelContext: ModelContext?, interactor: MovieInteractorProtocol = MovieInteractorPreview()) {
        self.modelContext = modelContext
        self.interactor = interactor
    
    }

    func importMovies() async {
        guard let modelContext = modelContext else { return }
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
    
    func addFavoriteMovie(movieId: Int) async {


        let parameters = [
          "media_type": "movie",
          "media_id": "\(movieId)",
          "favorite": true
        ] as [String : Any?]

        do {
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let url = URL(string: "https://api.themoviedb.org/3/account/20701631/favorite")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.timeoutInterval = 10
            request.allHTTPHeaderFields = [
              "accept": "application/json",
              "content-type": "application/json",
              "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
            ]
            request.httpBody = postData
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse {
                print("statusCode: \(httpResponse.statusCode)")
            }
            if let jsonString = String(data: data, encoding: .utf8) {
                print("La respuesta de agregar una movie favorita es: \(jsonString)")
            }
            
//            print(data)
        } catch {
            print("Error: cannot convert parameters to JSON data")
        }
        
    }

}
