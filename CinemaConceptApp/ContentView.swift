//
//  ContentView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectTab = "Main"
    @State private var index: Int = 1
    // 0 = Unauthorized, 1 = Authorized
    
    let tabs = ["Downloads", "Search", "Main", "List", "Settings"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        // MARK: WELCOME & SIGN IN = 0 / OTHER = 1
        if index == 0 {
            WelcomeView()
        } else {
            ZStack(alignment: .bottom) {
                
                TabView(selection: $selectTab) {
                    
                    ViewDownloads()
                        .tag("Downloads")
                    ViewSearch()
                        .tag("Search")
                    ViewMain()
                        .tag("Main")
                    ViewList()
                        .tag("List")
                    ViewSettings()
                        .tag("Settings")
                }
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        TabBarItem(tab: tab, selected: $selectTab)
                    }
                }
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(.BGCOLOR)
            }
        }
    }
}

struct TabBarItem: View {
    @State var tab: String
    @Binding var selected: String
    var body: some View {
        ZStack {
            Button {
                selected = tab
            } label: {
                HStack {
                    Image(tab)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
        }
        .colorMultiply(selected == tab ? .PRIMARYCOLOR: .SECONDCOLOR)
        .padding(.horizontal, 25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
