//
//  AppStoreGamesView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct AppStoreGamesView: View {
    
    var presentation: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(
                    presentation: presentation,
                    attributes: AppStoreHeaderAttributes(
                        title: "Games")
                )
                Spacer()
            }
        }
    }
}

struct AppStoreGamesView_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentation
    
    static var previews: some View {
        AppStoreGamesView(presentation: presentation)
    }
}
