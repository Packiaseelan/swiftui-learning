//
//  AppStoreArcadeView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppStoreArcadeView: View {
    
    var presentation: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(
                    presentation: presentation,
                    attributes: AppStoreHeaderAttributes(
                        title: "Arcade")
                )
                Spacer()
            }
        }
    }
}

struct AppStoreArcadeView_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentation
    static var previews: some View {
        AppStoreArcadeView(presentation: presentation)
    }
}
