//
//  XOButton.swift
//  TicTacToe
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct XOButton: View {
    
    @Binding var letter: String
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color("ButtonColor"))
                .frame(width: 100, height: 100)
            
            Text(letter)
                .font(.system(size: 50).weight(.bold))
        }
    }
}

struct XOButton_Previews: PreviewProvider {
    static var previews: some View {
        XOButton(letter: .constant("X"))
            .previewLayout(.sizeThatFits)
    }
}
