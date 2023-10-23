//
//  ViewSearch.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct ViewSearch: View {
    
    var title = ""
    
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
            
            Text(title)
                .font(.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .top)
        }
        .frame(height: 40)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        ViewSearch()
    }
}
