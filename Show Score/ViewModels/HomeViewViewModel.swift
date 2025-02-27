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
    

}
