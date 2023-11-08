//
//  GameGenresGirdView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct GameGenresGirdView: View {
    @StateObject var vm = GameGenresGridViewModel()
    let columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(vm.genres, id: \.self) { genre in
                            GameGenreGridViewCell(genre: genre, width: geometry.size.width / 2)
                                .frame(width: geometry.size.width / 2, height: 200)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GameGenresGirdView()
}
