//
//  HeaderView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 27/11/22.
//

import SwiftUI

struct HeaderView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        // headerView
        HStack {
            IconButton(iconName: "arrow.backward", action: onBack)
            Spacer()
            IconButton(iconName: "square.and.arrow.up", action: onShare)
        }
        .padding()
        .overlay(title)
        .padding(.top, getSafeAreaTopInsects())
        .background(Color("ParallaxAppBgColor"))
        .foregroundColor(Color("ParallaxAppTextColor"))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.sizeThatFits)
    }
}

extension HeaderView {
    private var title: some View {
        Text("Tiger")
            .font(.title2)
            .fontWeight(.bold)
            .shadow(color: Color("ParallaxAppTextColor").opacity(0.25), radius: 3, x: 0, y: 5)
    }
}

extension HeaderView {
    private func onBack() {
        presentation.wrappedValue.dismiss()
    }
    private func onShare() {}
}
