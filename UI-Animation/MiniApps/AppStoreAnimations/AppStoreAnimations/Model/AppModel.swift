//
//  AppModel.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import Foundation

struct AppModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    var source: String = "Apple"
}
