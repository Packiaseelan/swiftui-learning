//
//  WelcomeView.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

struct WelcomeView: View {
    @State var showSignIn: Bool = false
    @State var showSignUp: Bool = false
    
    var body: some View {
        ZStack {
            Image("welcome_screen")
                .resizable()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: .widthPer(per: 0.5))
                    .padding(.top, .topInsets + 8)
                
                Spacer()
                
                Text("The plan is expected in just a few days, and the mass of the sad lion. The bow, the lion, the urn of laughter.")
                    .multilineTextAlignment(.center)
                    .font(.customfont(.regular, fontSize: 14))
                    .padding(.horizontal, 20)
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                
                CustomButton(title: "Get Started") {
                    showSignUp.toggle()
                }
                .background(
                    NavigationLink(destination: SocialSignupView(), isActive: $showSignUp, label: {
                        EmptyView()
                    })
                )
                .padding(.bottom, 15)
                
                CustomButton(type: .secondary, title: "I have an account") {
                    showSignIn.toggle()
                }
                .background(
                    NavigationLink(destination: SignInView(), isActive: $showSignIn, label: {
                        EmptyView()
                    })
                )
                .padding(.bottom, .bottomInsets)
                
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
