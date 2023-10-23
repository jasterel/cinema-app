//
//  ViewDownloads.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct ViewDownloads: View {
    var body: some View {
        ZStack {
            Color(.gray)
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image("Barbie_Test")
                        .resizable()
                        .frame(width: 220, height: 150)
                        .padding(.vertical, 5)
                        .padding(.top, -20)
                    
                    Text("Barbie")
                        .font(.title3)
                        .fontWeight(.heavy)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                    
                    Text("2023")
                        .font(.subheadline)
                        .padding(.horizontal, 15)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 220, height: 220)
        .cornerRadius(20)
        .padding()
    }
}

struct ViewDownloads_Previews: PreviewProvider {
    static var previews: some View {
        ViewDownloads()
    }
}


//ZStack {
//    Color("backgroundCard")
//    
//    ZStack(alignment: .bottomTrailing) {
//        VStack(alignment: .leading) {
//            AsyncImage(url: trendingItem.backdropURL) { image in
//                image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(maxWidth: 260, maxHeight: 160)
//                    .cornerRadius(20)
//            } placeholder: {
//                Rectangle().fill(Color.backgroundCard)
//                    .frame(maxWidth: 180, maxHeight: 200)
//                ProgressView()
//            }
//            HStack {
//                Text(trendingItem.title)
//                    .foregroundColor(.white)
//                    .fontWeight(.heavy)
//                    .font(.system(size: 18))
//                Spacer()
//                Image(systemName: "heart")
//                    .foregroundColor(.white)
//            }
//            .padding(.top, 5)
//            HStack {
//                Image(systemName: "star.circle")
//                    .foregroundColor(.orange)
//                Text(String(format: "%.1f", trendingItem.vote_average))
//                    .bold()
//                    .foregroundColor(.white)
//            }
//        }
//        .padding()
//    }
//}
//.frame(maxWidth: 230, maxHeight: 200)
//.cornerRadius(20)
//.padding()
