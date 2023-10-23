//
//  ViewMain.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

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

class MovieDBViewModel: ObservableObject {
    
    @Published var top_rated: [movieCard] = []
    @Published var upcoming: [movieCard] = []
    @Published var topfilms: [movieCard] = []
    
    static let apiKey = "ee1152c6abd5e36c63073c06bdf106f5"
    static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZTExNTJjNmFiZDVlMzZjNjMwNzNjMDZiZGYxMDZmNSIsInN1YiI6IjY1MzNhODM3NDJkODM3MDE0ZGI4YTU2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vWt81DexiZeXLpO9Nn_xkKLw5zZ5fpqbJc_V9q7t0HI"
    
    func loadTop() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let topResults = try JSONDecoder().decode(TopResults.self, from: data)
                top_rated = topResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadNew() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let upcomingResults = try JSONDecoder().decode(TopResults.self, from: data)
                upcoming = upcomingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadRated() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(MovieDBViewModel.apiKey)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let tops = try JSONDecoder().decode(TopResults.self, from: data)
                topfilms = tops.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct TopResults: Decodable {
    let page: Int
    let results: [movieCard]
    let total_pages: Int
    let total_results: Int
}

struct movieCard: Identifiable, Decodable {
    let adult: Bool
    let id: Int
    let poster_path: String
    let title: String
    let vote_average: Float
    let backdrop_path: String
    
    var backdropURL: URL {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500/")!
        return baseURL.appending(path: backdrop_path)
    }
}

struct ViewMain_Previews: PreviewProvider {
    static var previews: some View {
        ViewMain()
    }
}
