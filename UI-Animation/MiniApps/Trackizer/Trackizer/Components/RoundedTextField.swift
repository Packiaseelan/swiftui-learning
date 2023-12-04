//
//  RoundedTextField.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

struct RoundedTextField: View {
    @State var title: String = "Title"
    @Binding var text: String
    @State var keyboardType:  UIKeyboardType = .default
    var textAlign:Alignment  = .leading
    var isPassword: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
                .multilineTextAlignment(.leading)
                .font(.customfont(.regular, fontSize: 14))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.gray50)
                .padding(.bottom, 4)
            
            if isPassword {
                SecureField("", text: $text)
                    .padding(15)
                    .frame(height: 48)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray70, lineWidth: 1)
                    }
                    .foregroundColor(.white)
                    .background(Color.gray60.opacity(0.05))
                    .cornerRadius(15)
            } else {
                TextField("", text: $text)
                    .padding(15)
                    .frame(height: 48)
                    .overlay {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray70, lineWidth: 1)
                    }
                    .foregroundColor(.white)
                    .background(Color.gray60.opacity(0.05))
                    .cornerRadius(15)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct RoundedTextField_Previews: PreviewProvider {
    @State static var txt: String = ""
    static var previews: some View {
        RoundedTextField(text: $txt)
            .previewLayout(.sizeThatFits)
    }
}
