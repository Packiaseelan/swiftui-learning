//
//  AppListView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppListView: View {
    
    @Binding var apps: [AppItem]
    
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
