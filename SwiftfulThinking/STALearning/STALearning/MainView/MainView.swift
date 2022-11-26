//
//  MainView.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            AdvancedListView()
                .tabItem {
                    Image(systemName: "list.triangle")
                    Text("Advanced")
                }
            CloudKitListView()
                .tabItem {
                    Image(systemName: "cloud.fill")
                    Text("CloudKit")
                }
        }
        .navigationTitle("STA Learning")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
