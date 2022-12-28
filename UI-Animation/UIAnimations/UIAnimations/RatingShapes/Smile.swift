//
//  Smile.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct Smile: Shape {
    @Binding var value: CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let center = rect.width / 2
            
            // changing values for Up Curve and Down Curve
            let downRadius: CGFloat = (115 * value) - 45
            
            path.move(to: CGPoint(x: center - 150, y: 0))
            
            let to1 = CGPoint(x: center, y: downRadius)
            let control1 = CGPoint(x: center - 145, y: 0)
            let control2 = CGPoint(x: center - 145, y: downRadius)
            
            let to2 = CGPoint(x: center + 150, y: 0)
            let control3 = CGPoint(x: center + 145, y: downRadius)
            let control4 = CGPoint(x: center + 145, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
}

struct Smile_Previews: PreviewProvider {
    static var previews: some View {
        Smile(value: .constant(0.5))
    }
}
