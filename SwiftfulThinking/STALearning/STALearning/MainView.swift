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
            
            Section(header: Text("Shapes")) {
                NavigationLink("Custom Shapes") {
                    CustomShapesBootcamp()
                }
                NavigationLink("Custom Curves") {
                    CustomCurvesBootcamp()
                }
                NavigationLink("Animatable Data") {
                    AnimatableDataBootcamp()
                }
            }
            
            Section(header: Text("Generics")) {
                NavigationLink("Generic") {
                    GenericsBootcamp()
                }
                NavigationLink("ViewBuilder") {
                    ViewBuilderBootcamp()
                }
                NavigationLink("Local ViewBuilder") {
                    LocalViewBuilderBootcamp(type: .one)
                }
            }
            
            Section(header: Text("Preference Key")) {
                NavigationLink("Preference Key") {
                    PreferenceKeyBootcamp()
                }
                NavigationLink("Geometry") {
                    GeometryPreferenceKeyBootcamp()
                }
                NavigationLink("Scrollview") {
                    ScrollViewOffsetPreferenceKeyBootcamp()
                }
            }
            
            Section(header: Text("Tabbars")) {
                NavigationLink("App Tabbar") {
                    AppTabBarView()
                }
                NavigationLink("Custom Tabbar") {
                    CustomTabBArView(tabs: [
                        .home, .favourites, .profile
                    ], selection: .constant(.home), localSelection: .home)
                }
            }
            
            Section(header: Text("UI Representables")) {
                NavigationLink("UI View") {
                    UIViewRepresentableBootcamp()
                }
                NavigationLink("UI View Controller") {
                    UIViewControllerRepresentableBootcamp()
                }
            }
            
            Section(header: Text("Protocols")) {
                NavigationLink("Protocols") {
                    ProtocolsBootcamp()
                }
            }
            
            Section(header: Text("Testing")) {
                NavigationLink("Unit Testing") {
                    UnitTestingBootcampView(isPremium: false)
                }
                NavigationLink("UI Testing") {
                    UITestingBootcampView(currentUserIsSignedIn: false)
                }
            }
            
            Section {
                NavigationLink("Advanced Combine") {
                    AdvancedCombineBootcamp()
                }
                NavigationLink("Futures") {
                    FuturesBootcamp()
                }
            }
        }
        .listStyle(GroupedListStyle())
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
