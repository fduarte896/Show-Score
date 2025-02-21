//
//  URLSession.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

extension URLSession {
    //Vamos a hacer una extensión de la URLSession con el fin de centralizar los llamados a red y darle un manejo a los posibles errores que se puedan generar a partir del mismo.
    func getData(for request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        
        do {
            let (data, response) = try await data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.noHTTP
            }
            return (data, httpResponse)
        } catch {
            throw NetworkError.general(error)
        }
    }
}
