//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Packiaseelan S on 12/11/22.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: reducer)
        
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}