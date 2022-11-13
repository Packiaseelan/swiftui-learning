//
//  CustomNavLink.swift
//  STALearning
//
//  Created by Packiaseelan S on 21/08/22.
//

import SwiftUI

struct CustomNavLink<Label: View, Destination: View>: View {
    
    let label: Label
    let destination: Destination
    
    init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    var body: some View {
        NavigationLink(destination: CustomNavBarContainerView(
            content: { destination }
        )
            .navigationBarHidden(true)
        ) {
            label
        }
    }
}

struct CustomNavLink_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(destination: Text("destination")) {
                Text("navigation")
            }
        }
    }
}
