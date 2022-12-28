//
//  ScreenUtility.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

// MARK: Global Properties for Screen

var screenRect: CGRect {
    UIScreen.main.bounds
}

var screenSize: CGSize {
    UIScreen.main.bounds.size
}

var screenHeight: Double {
    UIScreen.main.bounds.size.height
}

var screenWidth: Double {
    UIScreen.main.bounds.size.width
}

var safeAreaTopInsects: CGFloat? {
    get {
        UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.safeAreaInsets.top
    }
}
