//
//  MiniAppsView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct MiniAppsView: View {
    var body: some View {
        List {
            Section {
                NavigationLink("AppStore", destination: AppStoreHomeView())
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct MiniAppsView_Previews: PreviewProvider {
    static var previews: some View {
        MiniAppsView()
    }
}
