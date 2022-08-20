//
//  OnboardingView.swift
//  Restart
//
//  Created by Packiaseelan S on 19/08/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.size.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                headerSection
                Spacer()
                centerSection
                Spacer()
                footerSection
            }
        }
        .onAppear {
            isAnimating = true
        }
    }
}

// MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

extension OnboardingView {
    
    // MARK: - HEADER
    private var headerSection: some View {
        VStack(spacing: 0) {
            Text("Share.")
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .foregroundColor(.white)
            
            Text("""
            It's not how much we give but
            how much love we put into giving.
            """)
            .font(.title3)
            .fontWeight(.light)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 10)
        }
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeIn(duration: 1), value: isAnimating)
    }
    
    // MARK: - CENTER
    private var centerSection: some View {
        ZStack {
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
            
            Image("character-1")
                .resizable()
                .scaledToFit()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeOut(duration: 0.5), value: isAnimating)
        }
    }
    
    // MARK: - FOOTER
    private var buttonBackground: some View {
        ZStack {
            Capsule()
                .fill(.white.opacity(0.2))
            
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(8)
        }
    }
    
    private var footerSection: some View {
        ZStack {
            // PARTS OF THE CUSTOM BUTTON
            
            // 1. BACKGROUND (STATIC)
            buttonBackground
            
            // 2. CALL-TO-ACTION (STATIC)
            
            Text("Get Started")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 20)
            
            // 3. CAPSULE (SYNAMIC WIDTH)
            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: buttonOffset + 80)
                
                Spacer()
            }
            
            // 4. CIRCLE (DRAGGABLE)
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding(8)
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24, weight: .bold))
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width > 0 && gesture.translation.width <= buttonWidth - 80 {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.easeIn(duration: 0.5)) {
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth - 80
                                    isOnboardingViewActive = false
                                } else {
                                    buttonOffset = 0
                                }
                            }
                        }
                )
                
                Spacer()
            }
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)

    }
}
