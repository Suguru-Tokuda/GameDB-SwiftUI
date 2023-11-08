//
//  CustomNetworkError.swift
//  GameDBApp
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

enum CustomNetworkError : Error {
    case badUrlResponse(url: URL),
         invalidURL(url: String),
         unknown
}

extension CustomNetworkError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .badUrlResponse(url: let url):
            return "Bad response from URL. \(url)"
        case .invalidURL(url: let urlStr):
            return "Invalid url: \(urlStr)"
        case .unknown:
            return "Unknown error"
        }
    }
}
