//
//  Login.swift
//  Show Score
//
//  Created by Felipe Duarte on 5/02/25.
//

import Foundation
import SwiftData

/*
 
 El reto es lograr que un usuario se autentique usando sus credenciales en TMDB.
 
 Lo primero que vamos a hacer es crear un request token para poder validar el login del usuario en la plataforma. Con el request token obtenido, entonces debemos redirigir al usuario al siguiente link:
 
    https://www.themoviedb.org/authenticate/{REQUEST_TOKEN} donde reemplazamos la ultima parte con el token que fue generado y el usuario debera dar el permiso para usar su usuario.
 */

var globalSessionID : String?

//La respuesta de la creacion del token tiene los siguientes elementos:
struct RequestTokenResponse: Decodable {
    let success: Bool
    let expires_at: String
    let request_token: String
}


//Esta funcion trae el request Token
func createReQuestToken() async -> String? {

    let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.timeoutInterval = 10
    request.allHTTPHeaderFields = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
    ]

    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let token = try decoder.decode(RequestTokenResponse.self, from: data)
        print("Este es el token creado " + token.request_token)
        return token.request_token
        
    } catch {
        print("Error requesting token: \(error)")
        return nil
    }
    
}

/*

Luego con dicha aprobacion entonces se genera un session id con el request token autorizado, que nos permitira manipular los datos de la cuenta del usuario, como por ejemplo ver sus favoritos o despues marcar favoritos.
 
 La llamada para generar ese session id es la siguiente:
 
 */

struct SessionIdResponse: Decodable {
    let success : Bool
    let session_id : String
}

func createSessionId(token: String) async -> String? {

    let parameters = ["request_token": token] as [String : Any?]

    let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.timeoutInterval = 10
    request.allHTTPHeaderFields = [
      "accept": "application/json",
      "content-type": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
    ]
    
    do {
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = postData
    } catch {
        print("Error in the JSON serialization: \(error)")
        return nil
    }
//    request.httpBody = postData

    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        let sessionId = try decoder.decode(SessionIdResponse.self, from: data)
        print("Sesion iniciada correctamente: \(sessionId.session_id)")
//        print(sessionId.sessionId)
        
        return sessionId.session_id
    } catch {
        print("Error creating session id: \(error)")
        return nil
    }
}



func getFavouriteMovies(sessionId: String, modelContext: ModelContext) async {
    let url = URL(string: "https://api.themoviedb.org/3/account/\(sessionId)/favorite/movies")!
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let queryItems: [URLQueryItem] = [
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "page", value: "1"),
        URLQueryItem(name: "sort_by", value: "created_at.asc"),
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
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
        }
        
        //Con esto podemos imprimir el JSON y tenerlo a la mano para compararlo o hacer cualquier cosa.
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Respuesta JSON de movies favoritas: \(jsonString)")
        }
        
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let moviesResponse = try decoder.decode(PopularMoviesResponseModelDecode.self, from: data)
//        print(moviesResponse.results)
        for movieDecode in moviesResponse.results {
            let existingMovie = try? modelContext.fetch(FetchDescriptor<MovieModel>(predicate: #Predicate { $0.id == movieDecode.id })).first
            if let existingMovie = existingMovie {
                let favoriteMovie = FavoriteMovieModel(movie: existingMovie)
                modelContext.insert(favoriteMovie)
            } else {
                let newMovie = movieDecode.toMovieModel()
                newMovie.isPopular = false
                modelContext.insert(newMovie)
                let favoriteMovie = FavoriteMovieModel(movie: newMovie)
                modelContext.insert(favoriteMovie)
            }
        
        }

        try modelContext.save()
        print("Películas favoritas guardadas correctamente en SwiftData.")

    } catch {
        print("Error obteniendo y guardando películas favoritas: \(error.localizedDescription)")
    }
}

func getFavouriteTVShows(sessionId: String, modelContext: ModelContext) async {

    let url = URL(string: "https://api.themoviedb.org/3/account/\(sessionId)/favorite/tv")!
    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    let queryItems: [URLQueryItem] = [
      URLQueryItem(name: "language", value: "en-US"),
      URLQueryItem(name: "page", value: "1"),
      URLQueryItem(name: "sort_by", value: "created_at.asc"),
    ]
    components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

    var request = URLRequest(url: components.url!)
    request.httpMethod = "GET"
    request.timeoutInterval = 10
    request.allHTTPHeaderFields = [
      "accept": "application/json",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
    ]

    do{
        let (data, response) = try await URLSession.shared.data(for: request)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Status code: \(httpResponse.statusCode)")
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("La respuesta JSON de Tv shows favoritos es: \(jsonString)")
        }
        
        let decoder = JSONDecoder()
        let tvShowsFavoritesResponse = try decoder.decode(TVShowsResponseModelCodable.self, from: data)
        print(tvShowsFavoritesResponse.results)
        
        for tvShowDecoded in tvShowsFavoritesResponse.results {
            let existingTVShow = try? modelContext.fetch(FetchDescriptor<TVShowModel>(predicate: #Predicate { $0.id == tvShowDecoded.id })).first
            if let existingTVShow = existingTVShow {
                //Si tv show ya existe, entonces solo lo agregamos a favoritos
                let favoriteTVShow = FavoriteTVShowModel(tvShow: existingTVShow)
                modelContext.insert(favoriteTVShow)
                
            } else {
                let newTVShow = tvShowDecoded.toTVShowModel()
                newTVShow.isPopular = false
                modelContext.insert(newTVShow)
                let favoriteTVShow = FavoriteTVShowModel(tvShow: newTVShow)
                modelContext.insert(favoriteTVShow)
            }
//            let tvShow = tvShowDecoded.toTVShowModel()
//            modelContext.insert(tvShow)
//            let favoriteTVShow = FavoriteTVShowModel(tvShow: tvShow)
//            modelContext.insert(favoriteTVShow)
        }
        
        try modelContext.save()
        print("Los TV Shows favoritos se han guardado correctamente en SwiftData.")
        
    } catch {
        print("Error obteniendo y guardando los TV Shows")
    }
    
}

func addFavoriteMovie(movieId: Int, sessionID: String) async {
    
    let parameters = [
      "media_type": "movie",
      "media_id": "\(movieId)",
      "favorite": true
    ] as [String : Any?]

    do {
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let url = URL(string: "https://api.themoviedb.org/3/account/\(sessionID)/favorite")!
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
        
    } catch {
        print("Error: cannot add the movie with id: \(movieId) to favorites.")
    }
    
}
func addFavoriteTVShow(tvShowId: Int, sessionID: String) async {
    
    let parameters = [
        "media_type": "tv",
        "media_id": "\(tvShowId)",
        "favorite": true
    ] as [String : Any?]
    print(tvShowId)
    do {
        let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        let url = URL(string: "https://api.themoviedb.org/3/account/\(sessionID)/favorite")!
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
            print("La respuesta de agregar un TV Show favorita es: \(jsonString)")
            
        }
    } catch {
        print("Error: cannot add the tv show with id \(tvShowId) as favorite")
    }
}
