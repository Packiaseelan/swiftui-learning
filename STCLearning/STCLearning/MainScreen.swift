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
                
                Section(header: Text("Sounds & Vibrations")) {
                    
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
                
                Section(header: Text("Logic")) { 
                    
                    NavigationLink("Hashable") {
                        HashableBootcamp()
                    }
                    NavigationLink("Arrays") {
                        ArraysBootcamp()
                    }
                    NavigationLink("Core Data") {
                        CoreDataBootcamp()
                    }
                }
                
                Section(header: Text("Threads")) {
                    NavigationLink("Background Threads") {
                        BackgroundThreadBootcamp()
                    }
                    NavigationLink("Week Self") {
                        WeekSelfBootcamp()
                    }
                }
                
                Section(header: Text("Closures")) {
                    NavigationLink("Typealias") {
                        TypealiasBootcamp()
                    }
                    NavigationLink("Escaping") {
                        EscapingBootcamp()
                    }
                }
                
                Section(header: Text("Backend")) {
                    NavigationLink("Codable") {
                        CodableBootcamp()
                    }
                    NavigationLink("Download with escaping") {
                        DownloadWithEscapingBootcamp()
                    }
                    NavigationLink("Download with combine") {
                        DownloadWithCombine()
                    }
                    NavigationLink("Timer") {
                        TimerBootcamp()
                    }
                }
               
            }
            .navigationTitle("STC Learning")
            .navigationBarItems(leading: Text(""), trailing: Text(""))
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
