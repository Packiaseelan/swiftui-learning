//
//  SearchView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct AppStoreSearchView: View {
    
    @State var apps: [AppItem] = tempApps
    
    var body: some View {
        SearchNavigationView(
            view: AnyView(searchBody),
            placeHolder: "Games, Apps, Stories and More",
            title: "Search",
            onSearch: onSearch,
            onCancel: onCancel)
        .ignoresSafeArea()
    }
}

struct AppStoreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AppStoreSearchView()
    }
}

extension AppStoreSearchView {
    private var searchBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                DiscoverView()
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
}
