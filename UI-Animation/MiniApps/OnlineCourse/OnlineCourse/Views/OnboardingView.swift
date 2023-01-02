//
//  OnboardingView.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    
    @State var showModal = false
    @Binding var show: Bool
    
    private let button = RiveViewModel(fileName: "button", autoPlay: false)
    
    var body: some View {
        ZStack {
            Color("Shadow").ignoresSafeArea()
                .opacity(showModal ? 0.4 : 0)
            
            content
                .offset(y: showModal ? -50 : 0)
            
            closeButton
            
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(show: .constant(true))
    }
}

extension OnboardingView {
    private var buttonBackground: some View {
        Color.black
            .cornerRadius(30)
            .blur(radius: 10)
            .opacity(0.3)
            .offset(y: 10)
    }
    
    private var buttonOverlay: some View {
        Label("Start the course", systemImage: "arrow.forward")
            .offset(x: 4, y: 4)
            .customFont(.headline)
            .accentColor(.primary)
    }
    
    private var backgroundShape: some View {
        RiveViewModel(fileName: "shapes").view()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .blur(radius: 30)
            .blendMode(.hardLight)
    }
    
    private var backgroundLine: some View {
        Image("Spline")
            .blur(radius: 50)
            .offset(x: 200, y: 100)
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Learn design & code")
                .font(.custom("Poppins Bold", size: 60))
                .frame(width: 260, alignment: .leading)
            
            Text("Don’t skip design. Learn design and code, by building real apps with React and Swift. Complete courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            button.view()
                .frame(width: 236, height: 64)
                .background(buttonBackground)
                .overlay(buttonOverlay)
                .onTapGesture(perform: onStartCourse)
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.")
                .customFont(.footnote)
                .opacity(0.7)
        }
        .padding(40)
        .padding(.top, 40)
        .background(backgroundShape)
        .background(backgroundLine)
    }
    
    private var closeButton: some View {
        Button(action: onClose) {
            Image(systemName: "xmark")
                .foregroundColor(.white)
                .frame(width: 36, height: 36)
                .background(.black)
                .mask(Circle())
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .offset(y: showModal ? -200 : 80)
    }
}

extension OnboardingView {
    private func onClose() {
        withAnimation {
            show.toggle()
        }
    }
    
    private func onStartCourse() {
        button.play(animationName: "active")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            withAnimation(.spring()) {
                showModal.toggle()
            }
        }
    }
}
