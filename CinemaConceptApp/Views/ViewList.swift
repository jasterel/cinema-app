//
//  ViewList.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//
//  My List (Favorites) Page

import SwiftUI

struct ViewList: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Movies").font(.system(size:20, weight: .semibold)).foregroundColor(.white)
                Text("Top Rated").font(.system(size:11, weight: .light)).foregroundColor(.SUBCOLOR)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("BGCOLOR"), Color("BGCOLOR")]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            )
    }
}

struct ViewList_Previews: PreviewProvider {
    static var previews: some View {
        ViewList()
    }
}
