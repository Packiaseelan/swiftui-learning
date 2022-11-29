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
                    .tabItem { Label("Animation", systemImage: "app.dashed") }
                    .tag(1)
            }
            .navigationTitle(getTitle())
            .navigationBarItems(
                leading: IconButton(iconName: "line.3.horizontal", action: onMenuClick, font: .caption),
                trailing: IconButton(iconName: "gear", action: onSettingsClick, font: .caption)
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
    
    private func onMenuClick() {}
    
    private func onSettingsClick() {}
    
    private func getTitle() -> String {
        switch selection {
        case 1:
            return "UI Animation"
        default:
            return ""
        }
    }
}
