//
//  GameDatabaseTabView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct GameDatabaseTabView: View {
    var body: some View {
        TabView {
            GameDatabaseListView()
                .tabItem {
                    Label(
                        title: { Text("Trends") },
                        icon: { Image(systemName: "rectangle.grid.1x2") }
                    )
                }
            GameGenresGirdView()
                .tabItem {
                    Label(
                        title: { Text("Genres") },
                        icon: { Image(systemName: "list.bullet.clipboard") }
                    )
                }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(Color.theme.background)
        }
    }
}

#Preview {
    GameDatabaseTabView()
}
