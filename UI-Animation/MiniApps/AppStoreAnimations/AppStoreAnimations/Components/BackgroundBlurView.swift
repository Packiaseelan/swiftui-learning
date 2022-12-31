//
//  BackgroundBlurView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct BackgroundBlurView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundBlurView()
    }
}
