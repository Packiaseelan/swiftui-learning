//
//  ContentView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 14/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("Parallax") {
                    NavigationLink("Scroll", destination: HomeView())
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("UI Animation")
            .navigationBarItems(
                leading: IconButton(iconName: "line.3.horizontal", action: {}),
                trailing: IconButton(iconName: "gear", action: {})
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
