//
//  GameDatabaseService.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

class GameDatabaseService {
    static let shared = GameDatabaseService()
    
    @Published var gameResponse: GamesResponse?
    @Published var genreResponse: GenresResponse?
    
    func getGameDetailsUrl(slug: String) -> String {
        return "\(Constants.siteBaseUrl)/games/\(slug)"
    }
    
    init() {
        Task {
            try? await getGames()
        }
    }
    
    func getGames() async throws {
        let urlStr = "\(Constants.baseUrl)games?key=\(ApiKey().apiKey)"
        
        if let url = URL(string: urlStr) {
            let res = try await NetworkManager.shared.makeGetRequest(url: url, type: GamesResponse.self)
            if let res {
                self.gameResponse = res
            }
        } else {
            throw CustomNetworkError.invalidURL(url: urlStr)
        }
    }
    
    func getGenres() async throws {
        let urlStr = "\(Constants.baseUrl)genres?key=\(ApiKey().apiKey)"
        
        if let url = URL(string: urlStr) {
            let res = try await NetworkManager.shared.makeGetRequest(url: url, type: GenresResponse.self)
            if let res {
                self.genreResponse = res
            }
        } else {
            throw CustomNetworkError.invalidURL(url: urlStr)
        }
    }
}
