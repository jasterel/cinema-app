//
//  ViewSearch.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//
//  Interactive Search Page

import SwiftUI

struct ViewSearch: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Color.clear
                    .ignoresSafeArea()
                if searchText.isEmpty {
                    if viewModel.searchResults.isEmpty {
                        VStack {
                            Text("Find a Movie")
                                .font(.title.weight(.bold))
                            Text("Start searching for your favorite movie in one click")
                                .multilineTextAlignment(.center)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.gray)
                    }
                } else {
                    LazyVStack {
                        ForEach(viewModel.searchResults) { item in
                            HStack {
                                AsyncImage(url: item.moviePostURL) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 80, height: 120)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 80, height: 120)
                                }
                                .clipped()
                                .cornerRadius(20)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.orange, lineWidth: 1.5)
                                    )
                                .padding(.horizontal, 20)
                                .padding(.vertical, 5)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.system(size: 18))
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Text(item.release_date.dropLast(6))
                                        .padding(.top, 1)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            .background(Color("BGCOLOR")
                .ignoresSafeArea())
            .toolbarBackground(.BGCOLOR)
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) { oldValue, newValue in
            if newValue.count > 2 {
                viewModel.searchBar(term: newValue)
            }
        }
        .onAppear{
            viewModel.searchBar(term: "")
        }
        .accentColor(.orange)
        .preferredColorScheme(.dark)
    }
}

struct ViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        ViewSearch()
    }
}
