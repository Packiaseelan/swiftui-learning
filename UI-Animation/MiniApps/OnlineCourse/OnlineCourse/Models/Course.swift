//
//  Course.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var caption: String
    var color: Color
    var image: Image
}
