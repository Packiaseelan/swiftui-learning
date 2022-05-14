//
//  MainScreen.swift
//  STCLearning
//
//  Created by Packiaseelan S on 14/05/22.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Long Press Gesture") {
                    LongPressGestureBootcamp()
                }
                
                NavigationLink("Magnification Gesture") {
                    MagnificationBootcamp()
                }
                
                NavigationLink("Rotation Gesture") {
                    RotationGestureBootcamp()
                }
                
                NavigationLink("Drag Gesture") {
                    DragGestureBootcamp()
                }
                
                NavigationLink("Drag Gesture 2") {
                    DragGestureBootcamp2()
                }
            }
            .navigationTitle("STC Learning")
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
