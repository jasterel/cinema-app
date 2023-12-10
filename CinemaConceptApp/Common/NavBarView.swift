//
//  NavBarView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/22/23.
//

import SwiftUI

struct NavBarView: View {
    
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.BGCOLOR)
            
            Text(title)
                .font(.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .top)
                .foregroundColor(.white)
        }
        .frame(height: 40)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView(title: "Movies")
    }
}
