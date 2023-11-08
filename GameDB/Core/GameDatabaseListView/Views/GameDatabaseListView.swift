//
//  GameDatabaseListView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct GameDatabaseListView: View {
    @StateObject var vm = GameDatabaseListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background.ignoresSafeArea()
                List {
                    ForEach(vm.games, id: \.self) { game in
                        GameDatabaseListCellView(gameResult: game)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0.5, trailing: 0))
                            .background(Color.theme.background)
                            .background(NavigationLink("", destination: {
                                WebView(urlStr: GameDatabaseService.shared.getGameDetailsUrl(slug: game.slug))
                            }))
                    }
                }
                .listRowSpacing(20)
                .padding(.horizontal, 5)
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.theme.background)
            }
        }
    }
}

#Preview {
    GameDatabaseListView()
}
