//
//  SearchView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var apps: [AppModel] = tempApps
    @State private var showDiscover: Bool = true
    
    var body: some View {
        SearchNavigationView(
            placeHolder: "Games, Apps, Stories and More",
            title: "Search",
            onSearch: onSearch,
            onCancel: onCancel,
            onFocusChange: onFocusChange
        ){
            searchBody
        }
        .ignoresSafeArea()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension SearchView {
    private var searchBody: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                DiscoverView(show: $showDiscover)
                AppListView(apps: $apps)
            }
        }
    }
}

extension SearchView {
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
