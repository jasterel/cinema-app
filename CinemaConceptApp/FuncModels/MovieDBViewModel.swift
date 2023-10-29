//
//  MovieDBViewModel.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/24/23.
//

import SwiftUI

@MainActor
class MovieDBViewModel: ObservableObject {
    
    @Published var top_rated: [movieCard] = []
    @Published var upcoming: [movieCard] = []
    @Published var topfilms: [movieCard] = []
    @Published var searchResults: [movieCard] = []
    
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
    
    func searchBar(term: String) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDBViewModel.apiKey)&language=en-US&page=1&include_adult=true&query=\(term)")!
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let searching = try JSONDecoder().decode(TopResults.self, from: data)
                searchResults = searching.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

@MainActor
class MovieCastViewModel: ObservableObject {
    
    @Published var credits: movieCast?
    @Published var cast: [movieCast.Cast] = []
    
    func movieCredits(for movieID: Int) async {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDBViewModel.apiKey)&language=en-US")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let credits = try JSONDecoder().decode(movieCast.self, from: data)
            self.credits = credits
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadCast() async {
        do {
            for member in cast {
                let url = URL(string: "https://api.themoviedb.org/3/person/\(member.id)?api_key=\(MovieDBViewModel.apiKey)")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let profile = try JSONDecoder().decode(movieCast.Cast.self, from: data)
                cast.append(profile)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
