//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 21/06/22.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
