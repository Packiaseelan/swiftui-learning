//
//  AppStoreTodayView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppStoreTodayView: View {
    
    var presentation: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                AppStoreHeaderView(
                    presentation: presentation,
                    attributes: AppStoreHeaderAttributes(
                        date: getDateString(),
                        title: "Today")
                )
                
                Spacer()
            }
        }
    }
}

struct AppStoreTodayView_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentation
    static var previews: some View {
        AppStoreTodayView(presentation: presentation)
    }
}
