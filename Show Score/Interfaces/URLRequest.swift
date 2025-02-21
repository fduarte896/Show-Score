//
//  URLRequest.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

//En este archivo vamos a armar una URLRequest que nos sirva hacer las peticiones a la API. En este caso la API nos pide hacer una petición similar a lo siguiente:

//func hola() async throws {
//    let url = URL(string: "https://api.themoviedb.org/3/movie/popular")!
//    var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
//    let queryItems: [URLQueryItem] = [
//      URLQueryItem(name: "language", value: "en-US"),
//      URLQueryItem(name: "page", value: "1"),
//    ]
//    components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
//
//    var request = URLRequest(url: components.url!)
//    request.httpMethod = "GET"
//    request.timeoutInterval = 10
//    request.allHTTPHeaderFields = [
//      "accept": "application/json",
//      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsIm5iZiI6MTY5OTg3OTg3MS4zMDcwMDAyLCJzdWIiOiI2NTUyMWJiZmZkNmZhMTAwYWI5NzFkMmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.peObVLgL6LnNpfdnr6VPK99q_Lvxm7U2DVr1VTt8z4w"
//    ]
//    let (data, _) = try await URLSession.shared.data(for: request)
//    print(String(decoding: data, as: UTF8.self))
//}

//Por lo tanto vamos a construir la request completa a partir de una URL que suministremos.

extension URLRequest {
    static func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url) //Esta es la request que vamos a devolver al final, pero a la que le vamos a hacer las adiciones porque solo con la URL no basta para hacer la petición.
        
        request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5Y2ZjYmE2N2NmNDQzNzU3OGNmN2EwY2ZhNjU1ODI0YyIsInN1YiI6IjY1NTIxYmJmZmQ2ZmExMDBhYjk3MWQyZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.veNtFqNZoKWfwCtR7kyay0uOMI09MWTl6ly96arURvg", forHTTPHeaderField: "Authorization") //En esta linea agregamos el header que proporciona al servidor el token de autenticación con el fin de que nos autorice la petición.
        request.setValue("application/json", forHTTPHeaderField: "accept") //Con esto el servidor sabe que nos debe devolver un JSON.
        
        
        return request
    }
}
