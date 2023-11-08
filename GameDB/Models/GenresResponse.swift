//
//  GenresResponse.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation

struct GenresResponse: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [GenreResult]?
    
    enum CodingKeys: String, CodingKey {
        case count, 
             next,
             previous, 
             results
    }
}

struct GenreResult: Codable, Identifiable, Hashable {
    let id, gamesCount: Int
    let name, slug, imageBackground: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug,
             gamesCount = "games_count",
             imageBackground = "image_background"
    }
}
