//
//  NetworkErrors.swift
//  Show Score
//
//  Created by Felipe Duarte on 15/01/25.
//

import Foundation

enum NetworkError: LocalizedError {
    case noHTTP
    case general(Error)
    case decodingJSON(Error)
    case statusCode(Int)
    
    var errorDescription: String? {
        switch self {
        case .noHTTP:
            "No HTTP Conection"
        case .general(let error):
            "General Error \(error)"
        case .decodingJSON(let error):
            "Error Decoding JSON \(error)"
        case .statusCode(let statuscode):
            "Invalid Statuscode \(statuscode)"
        }
    }
}
