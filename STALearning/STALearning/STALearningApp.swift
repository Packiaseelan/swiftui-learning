//
//  STALearningApp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

@main
struct STALearningApp: App {
    
//    var currentUserIsSignedIn: Bool
//
//    init() {
//        // Launch arguments
////        let userIsSignedIn = CommandLine.arguments.contains("-UITexst_startSignedIn") ? true : false
////        let userIsSignedIn = ProcessInfo.processInfo.arguments.contains("-UITexst_startSignedIn") ? true : false
//        // Environment variable
//        let value = ProcessInfo.processInfo.environment["-UITexst_startSignedIn2"]
//        let userIsSignedIn = value == "true" ? true : false
//
//        self.currentUserIsSignedIn = userIsSignedIn
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            UITestingBootcampView(currentUserIsSignedIn: currentUserIsSignedIn)
//        }
//    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
}
