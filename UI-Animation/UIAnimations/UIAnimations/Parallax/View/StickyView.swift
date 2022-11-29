//
//  StickyView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 27/11/22.
//

import SwiftUI

struct StickyView: View {
    
    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat
    
    func getScreen() -> CGRect{
        UIScreen.main.bounds
    }

    var body: some View {
        ZStack {
            Color.black
            GeometryReader { reader -> AnyView in
                
                // Eliminating The Header View Height from Image
                let minY = self.firstMinY - reader.frame(in: .global).minY
                
                // Scaling View
                // to avoid negatives
                
                // your own value for scaling Effect
                let progress = (minY > 0 ? minY : 0) / 200
                
                let scale = (1 - progress) * 1
                
                // Image Scaling
                
                // Only 0.1 Scaling for Inner Image
                let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
                
                // Image Offset
                let imageOffset = imageScale > 0 ? (1 - imageScale) * 200 : 20
                DispatchQueue.main.async {
                    if self.firstMinY == 0 {
                        self.firstMinY = reader.frame(in: .global).minY
                    }
                    self.minY = minY
                    
                    // Getting Last MinY value when the Scale reaches 0.4
                    if scale < 0.4 && lastMinY == 0 {
                        self.lastMinY = minY
                    }
                    
                    self.scale = scale
                }
                
                return AnyView(
                    Image("p5")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: getScreen().width, height: getScreen().height - firstMinY)
                        .cornerRadius(1)
                        .scaleEffect(scale < 0.6 ? imageScale : 1)
                        .offset(y: scale < 0.6 ? imageOffset : 0)
                        .overlay(
                            ZStack {
                                VStack {
                                    Text("Tiger")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    Text("The most magnificent creature in the entire world")
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 10)
                                }
                                .foregroundColor(Color("ParallaxAppTextColor"))
                                .offset(y: 15)
                                // Hiding
                                // Hiding before Scale 0.6
                                .opacity(Double(scale - 0.7) / 0.3)
                                Spacer()
                                // Showing Info Details
                                Text("The Tiger lies\nlow not from fear,\nbut for aim.")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("ParallaxAppTextColor"))
                                    .scaleEffect(1.5)
                                    .opacity(0.1 - Double(scale - 0.7) / 0.3)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 400)
                            }
                        )
                        .background(backgroundFrame)
                    // Limiting
                        .scaleEffect(scale > 0.6 ? scale : 0.6)
                    // Logic to move View up when it reaches Button
                        .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                    // Offset
                        .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
                )
            }
            .frame(width: getScreen().width, height: getScreen().height - firstMinY)
            .overlay(
                // Bottom Details
                VStack {
                    Text("Strong, powerful and one of the nature's most feared predators.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("ParallaxAppTextColor"))
                        .background(Color("ParallaxAppBgColor"))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {}, label: {
                        Text("Get Started")
                            .fontWeight(.bold)
                            .foregroundColor(Color("ParallaxAppBgColor"))
                            .padding(.vertical)
                            .padding(.horizontal, 30)
                            .background(Color("ParallaxAppTextColor"))
                    })
                    .padding(.top, 10)
                }
                .padding(.bottom, 70)
                // Disabling Scroll
                .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                // that's all the logic whenever the scroll reaches button it will enable full scroll
                , alignment: .bottom
        )
        }
        .navigationBarHidden(true)
    }
}

//struct StickyView_Previews: PreviewProvider {
//    static let val:  Binding<CGFloat> = .constant(250)
//    static var previews: some View {
//        StickyView(firstMinY: val, minY: val, lastMinY: val, scale: val)
//    }
//}

extension StickyView {
    private var backgroundFrame: some View {
        ZStack {
            // Only Showing after 0.6
            if scale < 0.6 {
                // BG and Info Card
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.6))
                
                VStack {
                    HStack {
                        Text("Tiger")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        ForEach(1...3, id: \.self) { _ in
                            Circle()
                                .fill(Color.gray)
                                .frame(width: 15, height: 15)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
    }
}
