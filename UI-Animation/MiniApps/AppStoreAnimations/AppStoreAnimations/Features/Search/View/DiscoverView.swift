//
//  DiscoverView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 11/12/22.
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
                    Button(d, action: onDiscoverSelect)
                        .font(.title2)
                    
                }
                .padding(1)
                .padding(.leading)
            }
        }
        .padding(.bottom)
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
