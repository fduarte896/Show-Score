//
//  SampleData.swift
//  TaskSwiftData
//
//  Created by Julio César Fernández Muñoz on 17/9/24.
//

import SwiftUI
import SwiftData

struct SampleData: PreviewModifier {
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Movies.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let pelicula1 = Movies(
            id: 974453,
            title: "Absolution",
            overview:  "An aging ex-boxer gangster working as muscle for a Boston crime boss receives an upsetting diagnosis.  Despite a faltering memory, he attempts to rectify the sins of his past and reconnect with his estranged children. He is determined to leave a positive legacy for his grandson, but the criminal underworld isn’t done with him and won’t loosen their grip willingly.",
            releaseDate: "2024-10-31",
            posterPath: "/2MeQG5Vq8rUnRAa463BZe5GNhVk.jpg",
            voteAverage: 5.863
        )
        
        let pelicula2 = Movies(
            id: 1184918,
            title: "Absolution 2",
            overview:  "An aging ex-boxer gangster working as muscle for a Boston crime boss receives an upsetting diagnosis.  Despite a faltering memory, he attempts to rectify the sins of his past and reconnect with his estranged children. He is determined to leave a positive legacy for his grandson, but the criminal underworld isn’t done with him and won’t loosen their grip willingly.",
            releaseDate: "2024-10-31",
            posterPath: "/2MeQG5Vq8rUnRAa463BZe5GNhVk.jpg",
            voteAverage: 5.863
        )
       
        
        container.mainContext.insert(pelicula1)
        container.mainContext.insert(pelicula2)

        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
