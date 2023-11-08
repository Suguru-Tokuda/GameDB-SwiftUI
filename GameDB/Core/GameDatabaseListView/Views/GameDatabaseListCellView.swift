//
//  GameDatabaseListCellView.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct GameDatabaseListCellView: View {
    var gameResult: GameResult
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: gameResult.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ZStack {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(3)
                        .controlSize(.mini)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100, alignment: .center)
            }
            .frame(alignment: .center)
            
            VStack(alignment: .leading) {
                Text(gameResult.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.theme.text)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .background(Color.theme.secondaryBackground.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    GameDatabaseListCellView(gameResult: Preview.PreviewData().games[0])
}
