//
//  ViewMain.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//
//  Movies Page (Main Page)

import SwiftUI

struct ViewMain: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    var body: some View {
        ScrollView {
            if viewModel.top_rated.isEmpty {
                Text("No Results")
            } else {
                
                // Trending
                
                HStack {
                    Text("Trending")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding(.top, 40)
                    Spacer()
                }
                // Scroll Trending
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.top_rated) { movie_card in
                            TrendingCard(trendingItem: movie_card)
                        }
                    }
                }
                
                // Upcoming
                
                HStack {
                    Text("Upcoming")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding(.top, 20)
                    Spacer()
                }
                // Scroll Upcoming
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.upcoming) { movie_card in
                            TrendingCard(trendingItem: movie_card)
                        }
                    }
                }
                
                // Top Rated
                
                HStack {
                    Text("Top Rated")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding(.top, 20)
                    Spacer()
                }
                // Scroll Top Rated
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.topfilms) { movie_card in
                            TrendingCard(trendingItem: movie_card)
                        }
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 35)
        .onAppear {
            viewModel.loadTop()
            viewModel.loadNew()
            viewModel.loadRated()
        }
        .padding()
        .background(Color("BGCOLOR"))
        .overlay (
            NavBarView(title: "Movies")
        )
    }
}

// if title > 18, put first 15 of title & "..."

struct TopResults: Decodable {
    let page: Int
    let results: [movieCard]
    let total_pages: Int
    let total_results: Int
}

struct movieCard: Identifiable, Decodable {
    let adult: Bool
    let id: Int
    let poster_path: String?
    let release_date: String
    let title: String
    let vote_average: Float
    let backdrop_path: String?
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")!
        return baseURL.appending(path: backdrop_path ?? "")
    }
    
    var moviePostURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100/")!
        return baseURL.appending(path: poster_path ?? "")
    }
}

struct ViewMain_Previews: PreviewProvider {
    static var previews: some View {
        ViewMain()
    }
}
