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
                Section(header: Text("Gestures")) {
                    
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
                
                Section(header: Text("UI")) {
                    
                    NavigationLink("ScrollView Reader") {
                        ScrollViewReaderBootcamp()
                    }
                    
                    NavigationLink("Geometry Reader") {
                        GeometryReaderBootcamp()
                    }
                    
                    NavigationLink("Multiple Sheet") {
                        MultipleSheetBootcamp()
                    }
                    
                    NavigationLink("Mask") {
                        MaskBootcamp()
                    }
                }
                
                Section(header: Text("")) {
                    
                    NavigationLink("Sounds") {
                        SoundsBootcamp()
                    }
                    
                    NavigationLink("Haptic") {
                        HapticsBootcamp()
                    }
                }
                
                Section(header: Text("Notifications")) {
                    
                    NavigationLink("Local Notification") {
                        LocalNotificationBootcamp()
                    }
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
