//
//  SignInView.swift
//  CinemaConceptApp
//
//  Created by Maxim on 10/19/23.
//

import SwiftUI

struct SignInView: View {
    
    @State private var mobileNumber: String = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(
                Font.custom("Craftwork Grotesk", size: 32)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
            
            TextField("Type in your number", text: $mobileNumber)
                .keyboardType(.numberPad)
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 16)
                .padding(.bottom, 17)
                .frame(width: 348, height: 50, alignment: .top)
                .background(Color(red: 0.16, green: 0.16, blue: 0.16))
                .cornerRadius(14)
                .padding(.vertical, 20)
            
            // MARK: Button to get a code
            Button {
                print("GetCodeView()")
            } label: {
                Text("Get A Code")
                    .font(
                        Font.custom("Craftwork Grotesk", size: 16)
                        .weight(.semibold)
                    )
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 14)
                    .frame(width: 345, alignment: .center)
                    .background(Color(red: 1, green: 0.62, blue: 0.01))
                    .cornerRadius(14)
            }
            
            VStack {
                Text("By clicking “Get a code” you agree with")
                    .font(
                        Font.custom("Craftwork Grotesk", size: 12)
                        .weight(.semibold)
                    )
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .padding(.bottom, -12)
                Group {
                    Text("the ")
                        .foregroundColor(Color.gray) +
                    Text("Terms of Use ")
                        .foregroundColor(Color.white) +
                    Text("and  ")
                        .foregroundColor(Color.gray) +
                    Text("Privacy Policy")
                        .foregroundColor(Color.white)
                }
                    .font(
                        Font.custom("Craftwork Grotesk", size: 12)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 10)
                    .padding(.bottom, 65)
            }
            
            VStack {
                Text("Or Sign In with")
                .font(
                Font.custom("Craftwork Grotesk", size: 12)
                .weight(.semibold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
                
                HStack {
                    ZStack {
                        Image("Ellipse")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("Google")
                    }
                    ZStack {
                        Image("Ellipse")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("apple")
                    }
                    ZStack {
                        Image("Ellipse")
                            .resizable()
                            .frame(width: 35, height: 35)
                        Image("facebook")
                    }
                }
                .padding(.top, 5)
            }
        }
        .preferredColorScheme(.dark)
        .padding(.bottom, 65)
        .accentColor(.orange)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
