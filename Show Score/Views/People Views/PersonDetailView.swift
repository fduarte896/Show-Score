//
//  PersonDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI

struct PersonDetailView: View {
    @State private var person : PersonDetailModel?
    var personID: Int
    
    var body: some View {
        if let person = person {
            Text(person.name).font(.title)
            if let profilePath = person.profilePath {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200\(profilePath)")) { image in
                    image.resizable().scaledToFit().frame(height: 300)
                } placeholder: {
                    Color.gray
                }

                .cornerRadius(8)
            }

            Text(person.knownForDepartment).font(.callout)
        } else {
            ProgressView("Loading person details...")
                .onAppear {
                    Task {
                        await fetchPersonDetails()
                    }
                }
        }
        
    }
    
    func fetchPersonDetails() async {


        guard let url = URL(string: "https://api.themoviedb.org/3/person/\(personID)") else {
            return
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "language", value: "en-US"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
        ]

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            if let decodedPerson = try? decoder.decode(PersonDetailModel.self, from: data) {
                person = decodedPerson
            } else {
                print("No se pudo decodificar la respuesta de la API para traer los detalles de la persona")
                print("📋 Respuesta: \(String(decoding: data, as: UTF8.self))")
            }
        } catch {
            print("❌ Error fetching person details: \(error)")
        }

    }
}



#Preview {
    PersonDetailView(personID: 6193)
}
