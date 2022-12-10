//
//  HomeView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var today = TodayViewModel()
    
    var body: some View {
        ZStack {
            TabView {
                TodayView()
                    .environmentObject(today)
                    .tabItem {
                        TabItemView(image: "today", title: "Today")
                    }
                
                Text("Games")
                    .tabItem {
                        TabItemView(image: "games", title: "Games")
                    }
                
                Text("Apps")
                    .tabItem {
                        TabItemView(image: "apps", title: "Apps")
                    }
                
                Text("Arcade")
                    .tabItem {
                        TabItemView(image: "arcade", title: "Arcade")
                    }
                
                SearchView()
                    .tabItem {
                        TabItemView(image: "search", title: "Search")
                    }
            }
            
            DetailsView()
                .environmentObject(today)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
