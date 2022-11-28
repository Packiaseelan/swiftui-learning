//
//  UIAnimationView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/11/22.
//

import SwiftUI

struct UIAnimationView: View {
    var body: some View {
        List {
            Section {
                NavigationLink("Parallax Scroll", destination: ParallaxHomeView())
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct UIAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        UIAnimationView()
    }
}
