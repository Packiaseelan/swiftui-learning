//
//  MenuSection.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct MenuSection: View {
    
    let title: String
    let menu: [MenuItem]
    @Binding var selectedMenu: SelectedMenu
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            Text(title)
                .font(.subheadline).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 40)
                .padding(.bottom, 8)
                .opacity(0.7)
            
            ForEach(menu) { item in
                Rectangle()
                    .frame(height: 1)
                    .opacity(0.1)
                    .padding(.horizontal, 16)
                
                HStack(spacing: 14) {
                    item.icon.view()
                        .frame(width: 32, height: 32)
                        .opacity(0.6)
                    Text(item.text)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(buildBackground(for: item))
                .background(Color("Background 2"))
                .onTapGesture {
                   onMenuChange(for: item)
                }
            }
        }
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
    }
}

struct MenuSection_Previews: PreviewProvider {
    static var previews: some View {
        MenuSection(title: "Brouse", menu: menuItems, selectedMenu: .constant(.home))
    }
}

extension MenuSection {
    @ViewBuilder
    private func buildBackground(for item: MenuItem) -> some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(.blue)
            .frame(maxWidth: selectedMenu == item.menu ? .infinity : 0)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func onMenuChange(for item: MenuItem) {
        withAnimation(.timingCurve(0.2, 0.8, 0.2, 1)) {
            selectedMenu = item.menu
        }
        item.icon.setInput("active", value: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            item.icon.setInput("active", value: false)
        }
    }
}
