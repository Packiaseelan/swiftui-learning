//
//  CustomNavBarContainerView.swift
//  STALearning
//
//  Created by Packiaseelan S on 20/08/22.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    
    @State private var showBackButton: Bool = true
    @State private var title: String = ""
    @State private var subTitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subTitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            Color.green
                .ignoresSafeArea()
                .customNavTitle("new title")
                .customNavSubtitle("my sub title")
        }
    }
}
