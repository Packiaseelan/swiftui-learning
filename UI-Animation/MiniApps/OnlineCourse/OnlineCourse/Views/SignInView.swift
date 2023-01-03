//
//  SignInView.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI
import RiveRuntime

struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @Binding var show: Bool
    
    private let confetti = RiveViewModel(fileName: "confetti", stateMachineName: "State Machine 1")
    private let check = RiveViewModel(fileName: "check", stateMachineName: "State Machine 1")
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Sign in")
                .customFont(.largeTitle)
            Text("Access to 240+ hours of content. Learn design and code, by building real apps with React and Swift.")
                .foregroundColor(.secondary)
            
            emailField
            passwordField
            loginButton
            
            orDivider
            
            Text("Sign up with Email, Apple, Google")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            
            socialLogins
        }
        .padding(30)
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color("Shadow").opacity(0.3), radius: 5, x: 0, y: 3)
        .shadow(color: Color("Shadow").opacity(0.3), radius: 30, x: 0, y: 30)
        .overlay(background)
        .overlay(successOrLoading)
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(show: .constant(true))
    }
}

extension SignInView {
    private var successOrLoading: some View {
        ZStack {
            if isLoading {
                check.view()
                    .frame(width: 100, height: 100)
                    .allowsHitTesting(false)
            }
            confetti.view()
                .scaleEffect(3)
                .allowsHitTesting(false)
        }
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(.linearGradient(colors: [.white.opacity(0.8), .white.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    private var emailField: some View {
        VStack(alignment: .leading) {
            Text("Email")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            TextField("", text: $email)
                .customTextField(image: Image("Icon Email"))
        }
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading) {
            Text("Password")
                .customFont(.subheadline)
                .foregroundColor(.secondary)
            SecureField("", text: $password)
                .customTextField(image: Image("Icon Lock"))
        }
    }
    
    private var loginButton: some View {
        Button(action: onLogin) {
            HStack {
                Image(systemName: "arrow.right")
                Text("Sign in")
                    .customFont(.headline)
            }
            .largeButton()
        }
    }
    
    private var orDivider: some View {
        HStack {
            Rectangle().frame(height: 1).opacity(0.1)
            Text("OR").customFont(.subheadline2).foregroundColor(.black.opacity(0.3))
            Rectangle().frame(height: 1).opacity(0.1)
        }
    }
    
    private var socialLogins: some View {
        HStack {
            Image("Logo Email")
            Spacer()
            Image("Logo Apple")
            Spacer()
            Image("Logo Google")
        }
    }
}

extension SignInView {
    private func onLogin() {
        isLoading = true
        
        if !email.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                check.triggerInput("Check")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: showConfetti) 
            DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: closeDialog)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                check.triggerInput("Error")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                isLoading = false
            }
        }
    }
    
    private func showConfetti() {
        confetti.triggerInput("Trigger explosion")
        withAnimation {
            isLoading = false
        }
    }
    
    private func closeDialog() {
        withAnimation {
            show.toggle()
        }
    }
}
