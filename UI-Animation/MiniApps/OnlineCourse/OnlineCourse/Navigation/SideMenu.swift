//
//  SideMenu.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct SideMenu: View {
    @State var isDarkMode = false
    @AppStorage("selectedMenu") var selectedMenu: SelectedMenu = .home
    
    var body: some View {
        VStack(spacing: 0) {
            header
            
            MenuSection(title: "BROWSE", menu: menuItems, selectedMenu: $selectedMenu)
            
            MenuSection(title: "HISTORY", menu: menuItems2, selectedMenu: $selectedMenu)
           
            Spacer()
            
            darkModeSwitch
        }
        .foregroundColor(.white)
        .frame(maxWidth: 288, maxHeight: .infinity)
        .background(Color("Background 2"))
        .mask(Mask())
        .shadow(color: Color("Background 2").opacity(0.3), radius: 40, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

extension SideMenu {
    private var header: some View {
        HStack {
            Image(systemName: "person")
                .padding(12)
                .background(.white.opacity(0.2))
                .mask(Circle())
            VStack(alignment: .leading, spacing: 2) {
                Text("Meng To")
                Text("UI Developer")
                    .font(.subheadline)
                    .opacity(0.7)
            }
            Spacer()
        }
        .padding()
    }
    
    private var darkModeSwitch: some View {
        HStack(spacing: 14) {
            menuItems3[0].icon.view()
                .frame(width: 32, height: 32)
                .opacity(0.6)
                .onChange(of: isDarkMode, perform: onDarkModeChange)
            
            Text(menuItems3[0].text)
            
            Toggle("", isOn: $isDarkMode)
        }
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .mask(Mask(cornerRadius: 20))
        .padding(8)
    }
}

extension SideMenu {
    private func onDarkModeChange(value: Bool) {
        menuItems3[0].icon.setInput("active", value: value)
    }
}
