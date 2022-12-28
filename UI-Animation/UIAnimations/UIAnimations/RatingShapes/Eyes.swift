//
//  Eyes.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct Eyes: Shape {
    var value: CGFloat?
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let center = rect.width / 2
            
            // changing values for Up Curve and Down Curve
            let downRadius: CGFloat = 55 * (value ?? 1)
            
            path.move(to: CGPoint(x: center - 40, y: 0))
            
            let to1 = CGPoint(x: center, y: downRadius)
            let control1 = CGPoint(x: center - 40, y: 0)
            let control2 = CGPoint(x: center - 40, y: downRadius)
            
            let to2 = CGPoint(x: center + 40, y: 0)
            let control3 = CGPoint(x: center + 40, y: downRadius)
            let control4 = CGPoint(x: center + 40, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

struct Eyes_Previews: PreviewProvider {
    static var previews: some View {
        Eyes(value: 0.1)
            .previewLayout(.sizeThatFits)
    }
}
