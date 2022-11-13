//
//  AnyTransitionBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/06/22.
//

import SwiftUI

struct AnyTransitionBootcamp: View {
    
    @State var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
            }
            Spacer()
            
            Text("Click Me!")
                .withDefaultButtonStyle()
                .padding(.horizontal)
                .onTapGesture(perform: onClick)
        }
    }
    
    private func onClick() {
        withAnimation(.easeInOut) {
            showRectangle.toggle()
        }
    }
}

struct AnyTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootcamp()
    }
}
