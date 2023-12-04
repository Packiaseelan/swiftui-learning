//
//  SocialSignupView.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

struct SocialSignupView: View {
    @State var showSignUp: Bool = false
    
    var body: some View {
        VStack {
            Image("app_logo")
                .resizable()
                .scaledToFit()
                .frame(width: .widthPer(per: 0.5))
                .padding(.top, .topInsets + 8)
            
            Spacer()
            
            CustomButton(type: .apple, title: "Sign up with Apple", leadingIcon: "apple") {
                
            }
            .padding(.bottom, 20)
            
            CustomButton(type: .google, title: "Sign up with Google", leadingIcon: "google") {
                
            }
            .padding(.bottom, 20)
            
            CustomButton(type: .facebook, title: "Sign up with Facebook", leadingIcon: "fb") {
                
            }
            .padding(.bottom, 20)
            
            Text("or")
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .padding(.bottom, 30)
            
            CustomButton(type: .secondary, title: "Sign up with E-mail") {
                showSignUp.toggle()
            }
            .background(
                NavigationLink(destination: SignUpView(), isActive: $showSignUp, label: {
                    EmptyView()
                })
            )
            .padding(.bottom, 20)
            
            Text("By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.")
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .padding(.horizontal, 20)
                .foregroundColor(.gray60)
                .padding(.bottom, .bottomInsets + 8)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .background(Color.gray80)
    }
}

#Preview {
    SocialSignupView()
}
