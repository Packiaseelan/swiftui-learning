//
//  AppListView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct AppListView: View {
    
    @Binding var apps: [AppModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            SubTitleView(title: "Suggested")
            
            ForEach(apps) {
                AppItemCard(item: $0)
            }
        }
    }
}

struct AppListView_Previews: PreviewProvider {
    static var previews: some View {
        AppListView(apps: .constant(tempApps))
    }
}
