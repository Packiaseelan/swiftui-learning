//
//  AppNavBarView.swift
//  STALearning
//
//  Created by Packiaseelan S on 20/08/22.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
//        defaultNavigationView
        CustomNavView {
            ZStack {
                Color.red.ignoresSafeArea()
                
                CustomNavLink(destination: Text("destination").customNavBarItems(title: "Second screen")) {
                    Text("Navigate")
                }
            }
            .customNavTitle("my new title")
            .customNavSubtitle("sdf")
            .customNavBarBackButtonHidden(true)
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}

extension AppNavBarView {
    private var defaultNavigationView: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                NavigationLink(
                    destination:
                        Text("New destination")
                        .navigationTitle("new")
                        .navigationBarBackButtonHidden(true),
                    label: {Text("Navigate")}
                )
            }
            .navigationTitle("Nav Title here")
        }
    }
}
