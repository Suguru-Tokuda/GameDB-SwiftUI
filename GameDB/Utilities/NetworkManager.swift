//
//  NetworkManager.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

protocol NetworkableProtocol {
    func makeGetRequest<T: Decodable>(url: URL, type: T.Type) async throws -> T?
}

class NetworkManager : NetworkableProtocol {
    static let shared = NetworkManager()
    
    init() {}
    
    func makeGetRequest<T: Decodable>(url: URL, type: T.Type) async throws -> T? {
        do {
            let request = URLRequest(url: url)
            let (rawData, response) =  try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else { return nil }
            
            let data = try JSONDecoder().decode(type, from: rawData)
            
            return data
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }
}
