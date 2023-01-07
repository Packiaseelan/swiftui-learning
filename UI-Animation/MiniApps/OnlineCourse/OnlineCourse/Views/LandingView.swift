//
//  LandingView.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 07/01/23.
//

import SwiftUI

struct LandingView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        getView()
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 124)
            }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}

extension LandingView {
    @ViewBuilder
    func getView() -> some View{
        switch selectedTab {
        case .chat:
            HomeView()
        case .search:
            Color.red
                .ignoresSafeArea()
        case .timer:
            Color.blue
                .ignoresSafeArea()
        case .bell:
            Color.cyan
                .ignoresSafeArea()
        case .user:
            Color.yellow
                .ignoresSafeArea()
        }
    }
}
