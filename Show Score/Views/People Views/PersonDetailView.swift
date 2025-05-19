//
//  PersonDetailView.swift
//  Show Score
//
//  Created by Felipe Duarte on 27/01/25.
//

import SwiftUI

struct PersonDetailView: View {
    @State private var person: PersonDetailModel?
    var personID: Int
    @State private var showAlsoKnownAs = false
 
    
    var body: some View {
        Group {
            if let person = person {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Imagen + Nombre
                        HStack(alignment: .top, spacing: 16) {
                            if let url = person.urlToGetPersonImage {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                }
                                .frame(width: 120, height: 180)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(person.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Text(person.knownForDepartment)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                
                                if !person.alsoKnownAs.isEmpty {
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            Text("Also known as")
                                                .font(.headline)
                                            Spacer()
                                            Button(action: {
                                                withAnimation {
                                                    showAlsoKnownAs.toggle()
                                                }
                                            }) {
                                                Label(showAlsoKnownAs ? "Hide" : "Show", systemImage: showAlsoKnownAs ? "chevron.up" : "chevron.down")
                                                    .font(.caption)
                                            }
                                        }
                                        if let otherName = person.alsoKnownAs.first {
                                            Text(otherName)
                                        }
                                        if showAlsoKnownAs {
                                            ForEach(person.alsoKnownAs, id: \.self) { name in
                                                Text("• \(name)")
                                                    .font(.caption)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                    }
                                    .padding(.top, 8)
                                }

                            }
                        }
                        
                        // Biografía
                        if let bio = person.biography, !bio.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Biography")
                                    .font(.headline)
                                
                                Text(bio)
                                    .font(.body)
                            }
                        }
                        
                        // Información adicional
                        VStack(alignment: .leading, spacing: 8) {
                            if let birthday = person.birthday {
                                Text("🎂 Born: \(birthday)")
                            }
                            if let deathday = person.deathday {
                                Text("🪦 Died: \(deathday)")
                            }
                            if let place = person.placeOfBirth {
                                Text("📍 Place of Birth: \(place)")
                            }
                            Text("⭐ Popularity: \(String(format: "%.1f", person.popularity))")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    .padding()
                }
            } else {
                ProgressView("Loading person details...")
                    .onAppear {
                        Task {
                            await fetchPersonDetails()
                        }
                    }
            }
        }
        .navigationTitle(person?.name ?? "Person Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func fetchPersonDetails() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/person/\(personID)") else { return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [URLQueryItem(name: "language", value: "en-US")]
        components.queryItems = queryItems
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
                print("📋 Error decoding: \(String(decoding: data, as: UTF8.self))")
            }
        } catch {
            print("❌ Error fetching person details: \(error)")
        }
    }
}




#Preview {
    PersonDetailView(personID: 6193)
}
