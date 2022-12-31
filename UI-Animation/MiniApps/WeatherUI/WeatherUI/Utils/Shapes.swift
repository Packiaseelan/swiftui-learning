//
//  Shapes.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct Arc: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move (to: CGPoint (x: rect.minX - 1, y: rect.minY))
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX + 1, y: rect.minY),
            control: CGPoint (x: rect.midX, y: rect.midY)
        )
        path.addLine (to: CGPoint (x: rect.maxX + 1, y: rect.maxY + 1))
        path.addLine(to: CGPoint(x: rect.minX - 1, y: rect.maxY + 1))
        path.closeSubpath ()
        
        return path
    }
}

struct Trapezoid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.37965*height))
        path.addCurve(to: CGPoint(x: 0.03312*width, y: 0.02995*height), control1: CGPoint(x: 0, y: 0.18083*height), control2: CGPoint(x: 0, y: 0.08142*height))
        path.addCurve(to: CGPoint(x: 0.21492*width, y: 0.04559*height), control1: CGPoint(x: 0.06623*width, y: -0.02153*height), control2: CGPoint(x: 0.1158*width, y: 0.00085*height))
        path.addLine(to: CGPoint(x: 0.9003*width, y: 0.35499*height))
        path.addCurve(to: CGPoint(x: 0.98602*width, y: 0.42173*height), control1: CGPoint(x: 0.94813*width, y: 0.37658*height), control2: CGPoint(x: 0.97204*width, y: 0.38738*height))
        path.addCurve(to: CGPoint(x: width, y: 0.59997*height), control1: CGPoint(x: width, y: 0.45609*height), control2: CGPoint(x: width, y: 0.50405*height))
        path.addLine(to: CGPoint(x: width, y: 0.74857*height))
        path.addCurve(to: CGPoint(x: 0.98116*width, y: 0.96318*height), control1: CGPoint(x: width, y: 0.8671*height), control2: CGPoint(x: width, y: 0.92636*height))
        path.addCurve(to: CGPoint(x: 0.87135*width, y: height), control1: CGPoint(x: 0.96232*width, y: height), control2: CGPoint(x: 0.93199*width, y: height))
        path.addLine(to: CGPoint(x: 0.12865*width, y: height))
        path.addCurve(to: CGPoint(x: 0.01884*width, y: 0.96318*height), control1: CGPoint(x: 0.06801*width, y: height), control2: CGPoint(x: 0.03768*width, y: height))
        path.addCurve(to: CGPoint(x: 0, y: 0.74857*height), control1: CGPoint(x: 0, y: 0.92636*height), control2: CGPoint(x: 0, y: 0.8671*height))
        path.addLine(to: CGPoint(x: 0, y: 0.37965*height))
        path.closeSubpath()
        return path
    }
}

struct BottomAction: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.size.width
                let height = rect.size.height
                path.move(to: CGPoint(x: 0.42105*width, y: 0))
                path.addLine(to: CGPoint(x: 0.57895*width, y: 0))
                path.addCurve(
                    to: CGPoint(x: 0.77343*width, y: 0.48699*height),
                    control1: CGPoint(x: 0.69925*width, y: 0),
                    control2: CGPoint(x: 0.73497*width, y: 0.2414*height)
                )
                path.addCurve(
                    to: CGPoint(x: 0.98496*width, y: height),
                    control1: CGPoint(x: 0.81325*width, y: 0.74125*height),
                    control2: CGPoint(x: 0.85338*width, y: height)
                )
                path.addLine(to: CGPoint(x: 0.01504*width, y: height))
                path.addCurve(
                    to: CGPoint(x: 0.22657*width, y: 0.48699*height),
                    control1: CGPoint(x: 0.14662*width, y: height),
                    control2: CGPoint(x: 0.18675*width, y: 0.74125*height)
                )
                path.addCurve(
                    to: CGPoint(x: 0.42105*width, y: 0),
                    control1: CGPoint(x: 0.26503*width, y: 0.2414*height),
                    control2: CGPoint(x: 0.30075*width, y: 0)
                )
                path.closeSubpath()
        
        return path
    }
}
