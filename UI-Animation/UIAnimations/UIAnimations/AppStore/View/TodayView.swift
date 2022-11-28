//
//  TodayView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct TodayView: View {
    
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

struct TodayView_Previews: PreviewProvider {
    @Environment(\.presentationMode) static var presentation
    static var previews: some View {
        TodayView(presentation: presentation)
    }
}
