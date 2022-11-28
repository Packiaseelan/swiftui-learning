//
//  AppStoreHomeView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct AppStoreHomeView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        TabView {
            TodayView(presentation: presentation)
                .tabItem {
                    Image("today")
                        .renderingMode(.template)
                    Text("Today")
                }
            
            AppStoreGamesView(presentation: presentation)
                .tabItem {
                    Image("games")
                        .renderingMode(.template)
                    Text("Games")
                }
            
            AppStoreAppsView(presentation: presentation)
                .tabItem {
                    Image("apps")
                        .renderingMode(.template)
                    Text("Apps")
                }
            
            AppStoreArcadeView(presentation: presentation)
                .tabItem {
                    Image("arcade")
                        .renderingMode(.template)
                    Text("Arcade")
                }
            
            AppStoreSearchView()
                .tabItem {
                    Image("search")
                        .renderingMode(.template)
                    Text("Search")
                }
        }
        .navigationBarHidden(true)
    }
}

struct AppStoreHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreHomeView()
    }
}
