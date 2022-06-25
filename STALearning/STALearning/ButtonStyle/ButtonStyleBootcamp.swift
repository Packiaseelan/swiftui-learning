//
//  ButtonStyleBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Hello, World!")
                .withDefaultButtonStyle()
        }
        .withPressableButtonStyle()
        .padding()

    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}
