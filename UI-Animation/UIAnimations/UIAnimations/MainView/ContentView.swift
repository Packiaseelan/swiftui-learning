//
//  ContentView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                UIAnimationView()
                    .tabItem { Text("Animation") }
                    .tag(1)
                
                MiniAppsView()
                    .tabItem { Text("MiniApps") }
                    .tag(2)
            }
            .navigationTitle(getTitle())
            .navigationBarItems(
                leading: IconButton(iconName: "line.3.horizontal", action: {}, font: .caption),
                trailing: IconButton(iconName: "gear", action: {}, font: .caption)
            )
            .foregroundColor(.primary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private func getTitle() -> String {
        switch selection {
        case 1:
            return "UI Animation"
        case 2:
            return "Mini Apps"
        default:
            return ""
        }
    }
}
