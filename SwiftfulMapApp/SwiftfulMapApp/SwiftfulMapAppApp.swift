//
//  SwiftfulMapAppApp.swift
//  SwiftfulMapApp
//
//  Created by Packiaseelan S on 13/05/22.
//

import SwiftUI

@main
struct SwiftfulMapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
