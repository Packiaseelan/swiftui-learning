//
//  CustomCurvesBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 11/07/22.
//

import SwiftUI

struct CustomCurvesBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 100, height: 100)
            
            ArcSample()
                .stroke(lineWidth: 3)
                .frame(width: 100, height: 100)
            
            QuardSample()
                .frame(width: 100, height: 100)
            
            WaterShape()
                .frame(width: .infinity, height: 200)
                
        }
        .navigationTitle("Custom Curves")
    }
}

struct CustomCurvesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomCurvesBootcamp()
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: 0),
                        endAngle: Angle(degrees: 70),
                        clockwise: true)
        }
    }
}

struct QuardSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY),
                              control: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct WaterShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(to: CGPoint(x: rect.midX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.25, y: 0))
            
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                              control: CGPoint(x: rect.width * 0.75, y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
