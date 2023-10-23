//
//  Board.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/23/23.
//

import SwiftUI

struct Board: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Trend1ingCard: View {
    
    let trendingItem: movieCard
    
    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 200, maxHeight: 200)
            } placeholder: {
                Rectangle().fill(Color.backgroundCard)
                    .frame(maxWidth: 180, maxHeight: 200)
//                ProgressView()
            }
            
            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 18))
                    Spacer()
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                }
                HStack {
                    Image(systemName: "star.circle")
                        .foregroundColor(.orange)
                        .padding(.vertical, 0.5)
                    Text(String(format: "%.1f", trendingItem.vote_average))
                        .bold()
                        .foregroundColor(.white)
                     
                    Spacer()
                }
            }
            .padding()
            .background(Color(.backgroundCard))
        }
        .cornerRadius(20)
    }
}

#Preview {
    Board()
}
