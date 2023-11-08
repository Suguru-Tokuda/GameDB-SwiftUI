//
//  Preview.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation
import SwiftUI

extension Preview {
    struct PreviewData {
        let games: [GameResult] = [
            GameResult(id: 1, slug: "grand-theft-auto-v", name: "Grand Theft Auto V", backgroundImage: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg")
        ]
        
        let genres: [GenreResult] = [
            GenreResult(id: 4, gamesCount: 200000, name: "Action", slug: "action", imageBackground: "https://media.rawg.io/media/games/021/021c4e21a1824d2526f925eff6324653.jpg")
        ]
    }
}
