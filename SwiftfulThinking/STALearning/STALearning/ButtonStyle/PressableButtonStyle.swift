//
//  PressableButtonStyle.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scale: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? scale : 1.0)
    }
}

extension View {
    func withPressableButtonStyle(scale: CGFloat = 0.95) -> some View {
        buttonStyle(PressableButtonStyle(scale: scale))
    }
}
