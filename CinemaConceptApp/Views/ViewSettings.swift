//
//  ViewSettings.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct ViewSettings: View {
    var body: some View {
        VStack {
            Text("Profile").font(.system(size:20, weight: .semibold)).foregroundColor(.white)
            Text("Settings").font(.system(size:11, weight: .light)).foregroundColor(.SUBCOLOR)
            Divider()
            Spacer()
        }
        .background(Color.BGCOLOR)
    }
}

struct ViewSettings_Previews: PreviewProvider {
    static var previews: some View {
        ViewSettings()
    }
}
