//
//  GameGenresGridViewModel.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation
import Combine

class GameGenresGridViewModel : ObservableObject {
    @Published var genres: [GenreResult] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        Task {
            try? await GameDatabaseService.shared.getGenres()
        }
        
        addSubscriptions()
    }
    
    private func addSubscriptions() {
        Task {
            GameDatabaseService
                .shared
                .$genreResponse
                .receive(on: DispatchQueue.main)
                .sink { value in
                    
                    if let value,
                       let results = value.results {
                        self.genres = results
                    }
                }
                .store(in: &cancellables)
        }
    }
}
