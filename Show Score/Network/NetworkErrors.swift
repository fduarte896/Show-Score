//
//  NetworkErrors.swift
//  Show Score
//
//  Created by Laura Isabel Rojas Bustamante on 10/01/25.
//

import Foundation


enum NetworkErrors: LocalizedError {
    case invalidURL
    case httpError
    case statusCode(Int)
    case jsonDecodingError(Error)
    case generalError(Error)

    var errorDescription: String? {
        switch self {
        case .httpError:
            return "There was http error."
        case .statusCode(let code):
            return "There was an error connecting to the server. Status code: \(code)"
        case .jsonDecodingError(let error):
            return "There was an error decoding the JSON response. \(error)"
        case .generalError(let error):
            return "General error \(error.localizedDescription)"
        case .invalidURL:
            return "URL is invalid"
        }
    }
}
