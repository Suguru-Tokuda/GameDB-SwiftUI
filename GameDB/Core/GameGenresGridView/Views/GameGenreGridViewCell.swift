//
//  GameGenreGridViewCell.swift
//  GameDB
//
//  Created by Suguru Tokuda on 11/7/23.
//

import SwiftUI

struct GameGenreGridViewCell: View {
    var genre: GenreResult
    var width: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Text(genre.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("\(genre.gamesCount) games")
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.white)
            .zIndex(1)
            .frame(height: 100)
            AsyncImage(url: URL(string: genre.imageBackground)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: width)
                    .clipped()
            } placeholder: {
                ZStack {
                    ZStack {
                        ProgressView()
                            .progressViewStyle(.circular)
                            .scaleEffect(3)
                            .controlSize(.mini)
                    }
                    .frame(width: width, height: width, alignment: .center)
                }
            }
            
            Rectangle()
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                .frame(height: width)
                .opacity(0.1)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    GameGenreGridViewCell(genre: Preview.PreviewData().genres[0], width: 200)
}
