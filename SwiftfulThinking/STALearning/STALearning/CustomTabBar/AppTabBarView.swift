//
//  AppTabBarView.swift
//  STALearning
//
//  Created by Packiaseelan S on 05/08/22.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection: String = "Home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
//        defaultTabView
        CustomTabBarContainerView(selection: $tabSelection, content: {
            Color.red
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            Color.blue
                .tabBarItem(tab: .favourites, selection: $tabSelection)
            
            Color.green
                .tabBarItem(tab: .profile, selection: $tabSelection)
        })
        .navigationBarHidden(true)
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}

extension AppTabBarView {
    private var defaultTabView : some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favourite")
                }
        }
    }
}
