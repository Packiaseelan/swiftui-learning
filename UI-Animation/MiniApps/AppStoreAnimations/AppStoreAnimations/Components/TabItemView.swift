//
//  TabItemView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct TabItemView: View {
    let image: String
    let title: String
    
    var body: some View {
        VStack {
            Image(image)
                .renderingMode(.template)
            Text(title)
        }
    }
}

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabItemView(image: "today", title: "Home")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
