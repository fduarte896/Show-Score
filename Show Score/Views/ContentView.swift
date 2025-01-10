//
//  ContentView.swift
//  Show Score
//
//  Created by Felipe Duarte on 7/01/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var Movies: [Movies]
    
    var body: some View {
        VStack {
            if Movies.isEmpty {
                ContentUnavailableView("No hay Movies",
                                       systemImage: "popcorn",
                                       description: Text("Aún no existen movies en la app."))
                Spacer()
            } else {
                List {
                    ForEach(Movies) { movie in
                        Text(movie.title)
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
