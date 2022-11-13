//
//  DefaultButtonViewModifier.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let foregroundColor: Color
    let backgroundColor: Color
    let cornerRadius: Double
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(foregroundColor)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultButtonStyle(foregroundColor: Color = .white, backgroundColor: Color = .blue, cornerRadius: Double = 10.0) -> some View {
        modifier(DefaultButtonViewModifier(foregroundColor: foregroundColor, backgroundColor: backgroundColor, cornerRadius: cornerRadius))
    }
}
