//
//  IconButton.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct IconButton: View {
    let iconName: String
    let action: () -> ()
    let font: Font?
    
    init(iconName: String, action: @escaping () -> Void, font: Font? = nil) {
        self.iconName = iconName
        self.action = action
        self.font = font
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .font(font ?? .title2)
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(iconName: "heart", action: {})
            .previewLayout(.sizeThatFits)
    }
}
