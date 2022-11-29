//
//  DiscoverView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct DiscoverView: View {
    
    let discover = ["offline music player", "splayer", "background eraser", "whats tracker"]
    
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            SubTitleView(title: "Discover")
            
            ForEach(discover, id: \.self) { d in
                VStack(alignment: .leading) {
                    Divider()
                    Button(action: onDiscoverSelect) {
                        Text(d)
                    }
                }
                .padding(1)
                .padding(.leading)
            }
        }
        .frame(height:  show ? nil : 0)
        .opacity(show ? 1 : 0)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(show: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}

extension DiscoverView {
    private func onDiscoverSelect() {
        
    }
}
