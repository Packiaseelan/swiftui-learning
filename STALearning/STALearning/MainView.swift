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
            
            Section(header: Text("Matched Geometry Effect")) {
                NavigationLink("Example 1") {
                    MatchedGeometryExample1()
                }
                NavigationLink("Example 2") {
                    MatchedGeometryExample1()
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
