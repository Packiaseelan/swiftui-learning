//
//  MainView.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            Section(header: Text("Styles")) {
                NavigationLink("ViewModifier") {
                    ViewModifierBootcamp()
                }
                NavigationLink("Button Style") {
                    ButtonStyleBootcamp()
                }
                NavigationLink("Any Transition") {
                    AnyTransitionBootcamp()
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("STA Learning")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView()
        }
    }
}
