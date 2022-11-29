//
//  AppStoreSearchView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppStoreSearchView: View {
    
    @State private var apps: [AppItem] = tempApps
    @State private var showDiscover: Bool = true
    
    var body: some View {
        SearchNavigationView(
            view: AnyView(searchBody),
            placeHolder: "Games, Apps, Stories and More",
            title: "Search",
            onSearch: onSearch,
            onCancel: onCancel,
            onFocusChange: onFocusChange)
        .ignoresSafeArea()
    }
}

struct AppStoreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreSearchView()
    }
}

extension AppStoreSearchView {
    
    private var appList: some View {
        AppListView(apps: $apps)
    }
    
    private var searchBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                DiscoverView(show: $showDiscover)
                AppListView(apps: $apps)
            }
        }
    }
}

extension AppStoreSearchView {
    private func onSearch(query: String) {
        if query.isEmpty {
            self.apps = tempApps
        } else {
            self.apps = tempApps.filter({
                $0.name.lowercased().contains(query.lowercased())
            })
        }
    }
    
    private func onCancel() {
        self.apps = tempApps
    }
    
    private func onFocusChange(hasFocus: Bool) {
        self.showDiscover = !hasFocus
    }
}
