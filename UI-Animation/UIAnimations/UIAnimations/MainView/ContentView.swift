//
//  ContentView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 1
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                UIAnimationView()
                    .tabItem { Label("Animation", systemImage: "app.dashed") }
                    .tag(1)
            }
            .navigationTitle(title)
            .navigationBarItems(
                leading: menu,
                trailing: settings
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
    
    private var menu: some View {
        IconButton(iconName: "line.3.horizontal", action: onMenuClick, font: .caption)
    }
    
    private var settings: some View {
        IconButton(iconName: "gear", action: onSettingsClick, font: .caption)
    }
    
}

extension ContentView {
    
    private func onMenuClick() {}
    
    private func onSettingsClick() {}
    
    private var title: String {
        get {
            switch selection {
            case 1:
                return "UI Animation"
            default:
                return ""
            }
        }
    }
}
