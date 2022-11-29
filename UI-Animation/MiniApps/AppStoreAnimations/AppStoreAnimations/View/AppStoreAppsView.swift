//
//  AppStoreAppsView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppStoreAppsView: View {
    
    var presentation: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(
                    presentation: presentation,
                    attributes: AppStoreHeaderAttributes(
                        title: "Apps")
                )
                Spacer()
            }
        }
    }
}

struct AppStoreAppsView_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentation
    static var previews: some View {
        AppStoreAppsView(presentation: presentation)
    }
}

