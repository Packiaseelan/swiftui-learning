//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewModel())
        }
    }
}
