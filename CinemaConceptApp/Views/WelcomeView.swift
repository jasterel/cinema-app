//
//  WelcomeView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
            // MARK: BACKGROUND
        GeometryReader { geometry in
            ZStack {
                Image("bgwelcome")
                    .resizable()
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
            // MARK: GRADIENT
            VStack {
                Spacer()
                Rectangle()                    .foregroundColor(.clear)
                    .frame(width: 393, height: 321, alignment: .bottomLeading)
                    .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: .black.opacity(0), location: 0.00),
                            Gradient.Stop(color: .black, location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    )
            }
            VStack {
                Spacer()
                HStack {
                    Text("Welcome!")
                    .font(
                    Font.custom("Craftwork Grotesk", size: 32)
                    .weight(.semibold)
                    )
                    .padding(.leading, 5)
                    .padding(.bottom, 10)
                    Spacer()
                }
                HStack {
                    Text("Watch your favorite movies\nin one click")
                    .font(
                    Font.custom("Craftwork Grotesk", size: 14)
                    .weight(.semibold)
                    )
                    .kerning(0.57)
                    .padding(.leading, 5)
                    .padding(.bottom, 20)
                    Spacer()
                }
                Button {
                    print("Succeed! Forwarding to the SignInView")
                } label: {
                    Text("Sign In")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 14)
                        .frame(width: 345, alignment: .center)
                        .background(Color(red: 1, green: 0.62, blue: 0.01))
                        .cornerRadius(14)
                    
                        .font(
                        Font.custom("Craftwork Grotesk", size: 17)
                        .weight(.semibold)
                        )
                        .foregroundColor(.white)
                }
            }
            .accentColor(.orange)
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    WelcomeView()
}
