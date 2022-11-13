//
//  ViewModifierBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("Hello, World!")
                .withDefaultButtonStyle(backgroundColor: .red)
            Text("Hello, World!")
                .withDefaultButtonStyle(backgroundColor: .yellow)
            Text("Hello, World!")
                .withDefaultButtonStyle(cornerRadius: 30)
            Text("Hello, World!")
                .withDefaultButtonStyle()
        }
        .padding()
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
