//
//  TabBar.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .chat
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack { tabs }
                .frame(maxWidth: .infinity)
                .padding(12)
                .background(Color("Background 2").opacity(0.8))
                .background(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 26, style: .continuous))
                .shadow(color: Color("Background 2").opacity(0.3), radius: 20, x: 0, y: 20)
                .overlay(tabBarBackground)
                .padding(.horizontal, 24)
        }
        .offset(y: -24)
        .background(tabGradientBackground)
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension TabBar {
    private var tabs: some View {
        ForEach(tabItems) { item in
            Button {
                onTabSelect(item)
            } label: {
                buildTabItem(for: item)
            }
        }
    }
    
    private var tabBarBackground: some View {
        RoundedRectangle(cornerRadius: 26, style: .continuous)
            .stroke(.linearGradient(colors: [.white.opacity(0.5), .white.opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    
    private var tabGradientBackground: some View {
        LinearGradient(colors: [Color("Background").opacity(0), Color("Background")], startPoint: .top, endPoint: .bottom)
            .frame(height: 150)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .allowsHitTesting(false)
    }
    
    @ViewBuilder
    private func buildTabItem(for item: TabItem) -> some View {
        item.icon.view()
            .frame(width: 36, height: 36)
            .frame(maxWidth: .infinity)
            .opacity(selectedTab == item.tab ? 1 : 0.5)
            .background(buildTabBackground(for: item))
    }
    
    @ViewBuilder
    private func buildTabBackground(for item: TabItem) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: selectedTab == item.tab ? 20 : 0, height: 4)
                .offset(y: -4)
                .opacity(selectedTab == item.tab ? 1 : 0)
            Spacer()
        }
    }
}

extension TabBar {
    private func onTabSelect(_ item: TabItem) {
        item.icon.setInput("active", value: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            item.icon.setInput("active", value: false)
        }
        withAnimation {
            selectedTab = item.tab
        }
    }
}
