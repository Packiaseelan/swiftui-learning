//
//  DiscoverView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct DiscoverView: View {
    
    let discover = ["offline music player", "splayer", "background eraser", "whats tracker"]
    
    var body: some View {
        VStack(alignment: .leading) {
            SubTitleView(title: "Discover")
            
            ForEach(discover, id: \.self) { d in
                VStack(alignment: .leading) {
                    Divider()
                    Text(d)
                        .foregroundColor(.accentColor)
                }
                .padding(1)
                .padding(.leading)
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}


