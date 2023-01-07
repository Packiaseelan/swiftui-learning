//
//  ContentView.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 31/12/22.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @State var show = false
    @State var isOpen = false
    
    private let button = RiveViewModel(fileName: "menu_button", stateMachineName: "State Machine", autoPlay: false)
    
    var body: some View {
        ZStack {
            Color("Background 2").ignoresSafeArea()
            
            SideMenu()
                .padding(.top, 50)
                .opacity(isOpen ? 1 : 0)
                .offset(x: isOpen ? 0 : -300)
                .rotation3DEffect(.degrees(isOpen ? 0 : 30), axis: (x: 0, y: 1, z: 0))
                .ignoresSafeArea(.all, edges: .top)
            
            LandingView()
                .mask(Mask())
                .rotation3DEffect(.degrees(isOpen ? 30 : 0), axis: (x: 0, y: -1, z: 0), perspective: 1)
                .offset(x: isOpen ? 265 : 0)
                .scaleEffect(isOpen ? 0.9 : 1)
                .scaleEffect(show ? 0.92 : 1)
                .ignoresSafeArea()
            
            TabBar()
                .offset(y: isOpen ? 300 : 0)
                .offset(y: show ? 200 : 0)
            
            menuButton
            
            personIcon
            
            if show {
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(Mask())
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0, y: 40)
                    .ignoresSafeArea(.all, edges: .top)
                    .offset(y: show ? -10 : 0)
                    .zIndex(1)
                    .transition(.move(edge: .top))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var menuButton: some View {
        button
            .view()
            .frame(width: 44, height: 44)
            .mask(Circle())
            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding()
            .offset(x: isOpen ? 216 : 0)
            .onTapGesture(perform: onMenuClick)
            .onChange(of: isOpen, perform: onOpenChange)
    }
    
    private var personIcon: some View {
        Image(systemName: "person")
            .frame(width: 36, height: 36)
            .background(.white)
            .mask(Circle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .shadow(color: Color("Shadow").opacity(0.2), radius: 5, x: 0, y: 5)
            .padding()
            .offset(y: 4)
            .offset(x: isOpen ? 100 : 0)
            .onTapGesture(perform: onPersonClick)
    }
}

extension ContentView {
    private func onMenuClick() {
        button.setInput("isOpen", value: isOpen)
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            isOpen.toggle()
        }
    }
    
    private func onOpenChange(value: Bool) {
        if value {
            UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        } else {
            UIApplication.shared.setStatusBarStyle(.darkContent, animated: true)
        }
    }
    
    private func onPersonClick() {
        withAnimation(.spring()) {
            show.toggle()
        }
    }
}
