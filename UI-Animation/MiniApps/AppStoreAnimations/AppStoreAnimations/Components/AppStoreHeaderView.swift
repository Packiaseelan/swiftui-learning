//
//  AppStoreHeaderView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppStoreHeaderAttributes {
    let date: String?
    let title: String
    
    init(date: String? = nil, title: String) {
        self.date = date
        self.title = title
    }
}

struct AppStoreHeaderView: View {
    
    var presentation: Binding<PresentationMode>
    let attributes: AppStoreHeaderAttributes
    
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                if let date = attributes.date {
                    Text(date)
                        .foregroundColor(.secondary)
                }
                
                Text(attributes.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            IconButton(
                iconName: "person.circle",
                action: onProfileClick,
                font: .largeTitle)
        }
        .padding()
    }
}

struct AppStoreHeaderView_Previews: PreviewProvider {
    
    static let header = AppStoreHeaderAttributes(title: "Today")
    
    @Environment(\.presentationMode) static var presentation
    
    static var previews: some View {
        AppStoreHeaderView(presentation: presentation, attributes: header)
            .previewLayout(.sizeThatFits)
    }
}

extension AppStoreHeaderView {
    private func onProfileClick() {
        presentation.wrappedValue.dismiss()
    }
}
