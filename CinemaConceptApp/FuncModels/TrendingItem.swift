//
//  TrendingItem.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/24/23.
//

import SwiftUI

struct TrendingCard: View {
    
    let trendingItem: movieCard
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            AsyncImage(url: trendingItem.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: 593, maxHeight: 200)
            } placeholder: {
                Rectangle().fill(Color.backgroundCard)
                    .frame(maxWidth: 220, maxHeight: 220)
//                ProgressView()
            }
            
            VStack {
                HStack {
                    Text(trendingItem.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                    Spacer()
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                }
                HStack {
                    Image(systemName: "star.circle")
                        .foregroundColor(.orange)
                        .padding(.vertical, 0.5)
                    Text(String(format: "%.1f", trendingItem.vote_average))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .padding()
            .background(.ultraThinMaterial)        }
        .cornerRadius(20)
    }
}

