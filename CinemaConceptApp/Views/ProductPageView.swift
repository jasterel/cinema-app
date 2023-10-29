//
//  ProductPageView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/27/23.
//

import SwiftUI

struct ProductPageView: View {
    
    let movie: movieCard
    
    var body: some View {
        
        ZStack {
            Color.clear
            ScrollView {
                
                VStack {
                    AsyncImage(url: movie.moviePostURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 370)
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.24), radius: 12, x: 0, y: 2)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                
                HStack {
                    Text("TMDB Rating: ")
                        .bold()
                    Spacer()
                    Image(systemName: "star.circle")
                        .foregroundColor(.orange)
                        .padding(.vertical, 0.5)
                    Text(String(format: "%.1f", movie.vote_average))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 35)
                .padding(.top, 10)
                
                // FIXME: Button is elidgeable only if a text is clicked
                HStack {
                    Button("Play", action: playerOn)
                        .foregroundColor(.white)
                        .font(
                            Font.custom("Craftwork Grotesk", size: 16)
                            .weight(.semibold)
                        )
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 152, height: 45, alignment: .center)
                        .background(Color(red: 1, green: 0.62, blue: 0.01))

                        .cornerRadius(14)
                    Spacer()
                    Button("Watch Later", action: fav)
                        .font(
                            Font.custom("Craftwork Grotesk", size: 16)
                            .weight(.semibold)
                        )
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 151, height: 45, alignment: .center)
                        .cornerRadius(14)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                            .inset(by: 0.5)
                            .stroke(Color(red: 1, green: 0.62, blue: 0.01), lineWidth: 1)
                        )
                }
                .padding(.horizontal, 35)
                .padding(.vertical, 10)
                Divider()
                    .padding(.top, 10)
                
                // MARK: OVERVIEW
                HStack {
                    Text(movie.overview)
                }
                .padding(.horizontal, 35)
                .padding(.vertical, 10)
                Divider()
                
                // Movie Actors Will Be Here
            }
            .padding(.bottom, 60)
        }
        .accentColor(.orange)
        .background(Color("BGCOLOR")
            .ignoresSafeArea())
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
    
    func fav() {
        print("Added")
    }
    
    func playerOn() {
        print("Open Player")
    }
}

struct ProductPageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPageView(movie: .moviePage)
    }
}
