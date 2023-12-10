//
//  ProductPageView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/27/23.
//

import SwiftUI

struct ProductPageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let movie: movieCard
    
    @StateObject var model = MovieCastViewModel()
    
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
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                // FIXME: Button is elidgeable only if a text is clicked
                HStack {
                    Button {
                        print("OpenPlayer")
                    } label: {
                        Text("Play")
                            .foregroundColor(.white)
                            .font(
                                Font.custom("Craftwork Grotesk", size: 16)
                                .weight(.semibold)
                            )
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .frame(width: 167, height: 45, alignment: .center)
                            .background(Color(red: 1, green: 0.62, blue: 0.01))

                            .cornerRadius(14)
                    }
                    Spacer()
                    
                    Button {
                        print("Added")
                    } label: {
                        Text("Watch Later")
                            .font(
                                Font.custom("Craftwork Grotesk", size: 16)
                                .weight(.semibold)
                            )
                            .padding(.horizontal, 20)
                            .padding(.vertical, 14)
                            .frame(width: 166, height: 45, alignment: .center)
                            .cornerRadius(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 14)
                                .inset(by: 0.5)
                                .stroke(Color(red: 1, green: 0.62, blue: 0.01), lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                Divider()
                    .padding(.top, 10)
                
                // MARK: OVERVIEW
                Text(movie.overview)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                Divider()
                
                // Movie Actors Will Be Here
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(model.credits?.cast ?? []) { cast in
                            CastView(cast: cast)
                                .padding(.horizontal, 7)
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 60)
        }
        .accentColor(.orange)
        .background(Color("BGCOLOR")
            .ignoresSafeArea())
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
//        .overlay(alignment: .topLeading) {
//            Button {
//                dismiss()
//            } label: {
//                Image(systemName: "chevron.left")
//                    .imageScale(.large)
//                    .fontWeight(.bold)
//            }
//            .padding(.leading)
//        }
//        .toolbar(.hidden, for: .navigationBar)
        .task {
            await model.movieCredits(for: movie.id)
            await model.loadCast()
        }
    }
}

struct ProductPageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPageView(movie: .moviePage)
    }
}

struct CastView: View {
    
    let cast: movieCast.Cast
    
    var body: some View {
        VStack {
            AsyncImage(url: cast.castURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            .overlay(
                Circle()
                    .stroke(.orange, lineWidth: 1.5)
            )
            .padding(.vertical, 10)
            Text(cast.name)
                .frame(width: 100)
        }
    }
}
