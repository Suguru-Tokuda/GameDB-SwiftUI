//
//  GameDatabaseListViewModel.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import Foundation
import Combine

class GameDatabaseListViewModel : ObservableObject {
    @Published var games: [GameResult] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscriptions()
    }
    
    private func addSubscriptions() {
        Task {
            GameDatabaseService
                .shared
                .$gameResponse
                .receive(on: DispatchQueue.main)
                .sink { value in
                    if let value,
                       let results = value.results {
                        self.games = results
                    }
                }
                .store(in: &cancellables)
        }
    }
}
