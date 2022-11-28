//
//  Utilities.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 27/11/22.
//

import SwiftUI

func getSafeAreaTopInsects() -> CGFloat? {
    UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.safeAreaInsets.top
}
