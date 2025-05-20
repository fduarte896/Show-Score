//
//  URLRequest.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

//En este archivo vamos a armar una URLRequest que nos sirva hacer las peticiones a la API. En este caso la API nos pide hacer una petición similar a lo siguiente:



//Por lo tanto vamos a construir la request completa a partir de una URL que suministremos.

extension URLRequest {
    
    static func getRequest(url: URL) -> URLRequest {
        
        var apiKey = Bundle.main.infoDictionary?["TMDB_API_KEY"] as! String
        
        var request = URLRequest(url: url) //Esta es la request que vamos a devolver al final, pero a la que le vamos a hacer las adiciones porque solo con la URL no basta para hacer la petición.
        
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization") //En esta linea agregamos el header que proporciona al servidor el token de autenticación con el fin de que nos autorice la petición.
        request.setValue("application/json", forHTTPHeaderField: "accept") //Con esto el servidor sabe que nos debe devolver un JSON.
        
        
        return request
    }
}
