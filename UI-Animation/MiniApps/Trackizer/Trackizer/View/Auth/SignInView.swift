//
//  SignInView.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

struct SignInView: View {
    @State var txtEmail: String = ""
    @State var txtPassword: String = ""
    @State var isRemember: Bool = false
    @State var showSignUp: Bool = false
    
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
                Button {
                    isRemember.toggle()
                } label: {
                    HStack {
                        Image(systemName: isRemember ? "checkmark.square" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Remember me")
                            .multilineTextAlignment(.center)
                            .font(.customfont(.regular, fontSize: 14))
                    }
                }
                .foregroundColor(.gray50)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Forgot Password")
                        .multilineTextAlignment(.center)
                        .font(.customfont(.regular, fontSize: 14))
                }
                .foregroundColor(.gray50)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            
            CustomButton(title: "Sign In") {}
            .padding(.bottom, 150)
            
            Text("If you don't have an account yet?")
                .multilineTextAlignment(.center)
                .font(.customfont(.regular, fontSize: 14))
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                .padding(.bottom, 20)
            
            CustomButton(type: .secondary, title: "Sign Up") {
                showSignUp.toggle()
            }
            .background(
                NavigationLink(destination: SignUpView(), isActive: $showSignUp, label: {
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
    SignInView()
}
