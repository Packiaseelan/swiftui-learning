//
//  AnimatableDataBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 11/07/22.
//

import SwiftUI

struct AnimatableDataBootcamp: View {
    @State var animate: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: animate ? 30 : 0)
                .frame(width: 100, height: 100)
            
            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 30 : 0)
                .frame(width: 100, height: 100)
            
            PacMan(offsetAmount: animate ? 20 : 0)
                .frame(width: 100, height: 100)
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct AnimatableDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableDataBootcamp()
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: Double = 30
    
    var animatableData: Double {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                        radius: cornerRadius,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 180),
                        clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct PacMan: Shape {
    
    var offsetAmount: Double
    
    var animatableData: Double {
        get { offsetAmount }
        set {offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: offsetAmount),
                        endAngle: Angle(degrees: 360 - offsetAmount),
                        clockwise: false)
        }
    }
}
