//
//  AnimatedRatingShapes.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct AnimatedRatingShapes: View {
    
    @State var value: CGFloat = 0.0
    
    var body: some View {
        VStack {
            title
            
            Spacer(minLength: 0)
            
            HStack(spacing: 25) {
                ForEach(1...2, id: \.self) { _ in
                    ZStack {
                        Eyes()
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                        
                        Eyes(value: value)
                            .stroke(Color.black, lineWidth: 3)
                            .frame(width: 100)
                            .rotationEffect(Angle(degrees: 180))
                            .offset(y: -100)
                        
                        // Eye Dot
                        Circle()
                            .fill(Color.black)
                            .frame(width: 13, height: 13)
                            .offset(y: -30)
                    }
                    .frame(height: 100)
                }
            }
            
            Smile(value: $value)
                .stroke(Color.black, lineWidth: 3)
                .frame(height: 100)
                .padding(.top, 40)
            
            Spacer(minLength: 0)
            
            CustomSlider(value: $value)
            
            Spacer(minLength: 0)
            
            bottomCTA
            
        }
        .frame(maxWidth: .infinity)
        .background(bgColor)
    }
}

struct AnimatedRatingShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedRatingShapes()
    }
}

extension AnimatedRatingShapes {
    private var title: some View {
        Text("Do you like this ?")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .padding(.top, 20)
    }
    
    private var bottomCTA: some View {
        Button(action: onDone) {
            Text("Done")
                .fontWeight(.semibold)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width / 2)
                .background(Color.black)
        }
        .padding(.bottom)
    }
    
    private var bgColor: some View {
        (value <= 0.3 ? Color("1") : (value > 0.3 && value <= 0.7 ? Color("2") : Color("3")))
            .ignoresSafeArea()
            .animation(.easeInOut, value: value)
    }
}

extension AnimatedRatingShapes {
    private func onDone() {
        
    }
}
