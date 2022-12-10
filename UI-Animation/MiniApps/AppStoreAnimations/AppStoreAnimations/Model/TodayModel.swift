//
//  TodayModel.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import Foundation

protocol TodayProtocol: Identifiable {
    var id: String { get }
}

struct TodayModel: TodayProtocol {
    let id = UUID().uuidString
    let name: String
    let subtitle: String
    let image: String
    let shortDescription: String
    let description: String
}
