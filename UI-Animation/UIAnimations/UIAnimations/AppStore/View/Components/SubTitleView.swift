//
//  SubTitleView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct SubTitleView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title)
            .fontWeight(.bold)
            .padding(.leading)
    }
}

struct SubTitleView_Previews: PreviewProvider {
    static var previews: some View {
        SubTitleView(title: "Title")
            .previewLayout(.sizeThatFits)
    }
}
