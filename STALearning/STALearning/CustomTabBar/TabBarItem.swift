//
//  TabBarItem.swift
//  STALearning
//
//  Created by Packiaseelan S on 18/08/22.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home, favourites, profile
    
    var iconName: String {
        switch self {
            case .home: return "house"
            case .favourites: return "heart"
            case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
            case .home: return "Home"
            case .favourites: return "Favourite"
            case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
            case .home: return .red
            case .favourites: return .blue
            case .profile: return .green
        }
    }
}
