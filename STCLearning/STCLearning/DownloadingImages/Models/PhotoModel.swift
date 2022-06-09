//
//  PhotoModel.swift
//  STCLearning
//
//  Created by Packiaseelan S on 08/06/22.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
