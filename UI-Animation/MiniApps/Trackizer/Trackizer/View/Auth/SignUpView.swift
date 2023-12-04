//
//  SignUpView.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

struct SignUpView: View {
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var showSignIn: Bool = false
    
    var body: some View {
        VStack {
            Image("app_logo")
                .resizable()
                .scaledToFit()
                .frame(width: .widthPer(per: 0.5))
                .padding(.top, .topInsets + 8)
            
            Spacer()
            
            RoundedTextField(title: "E-mail address", text: $txtEmail)
            
            RoundedTextField(title: "Password", text: $txtPassword, isPassword: true)
            
            HStack {
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 5, maxHeight: 5)
                    .padding(.horizontal, 1)
                
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 5, maxHeight: 5)
                    .padding(.horizontal, 1)
                
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 5, maxHeight: 5)
                    .padding(.horizontal, 1)
                
                Rectangle()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 5, maxHeight: 5)
                    .padding(.horizontal, 1)
            }
            .padding(.horizontal, 20)
            .foregroundColor(.gray60)
            .padding(.bottom, 20)
            
            Text("Use 8 or more characters with a mix of letters, numbers & symbols.")
                .multilineTextAlignment(.leading)
                .font(.customfont(.regular, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            CustomButton(title: "Get Started, it's free!") {}
            .padding(.bottom, 150)
            
            Text("Do you have already an account?")
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            CustomButton(type: .secondary, title: "Sign In") {
                showSignIn.toggle()
            }
            .background(
                NavigationLink(destination: SignUpView(), isActive: $showSignIn, label: {
                    EmptyView()
                })
            ) 
            .padding(.bottom, .bottomInsets)
            
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        .background(Color.gray80)
    }
}

#Preview {
    SignUpView()
}
