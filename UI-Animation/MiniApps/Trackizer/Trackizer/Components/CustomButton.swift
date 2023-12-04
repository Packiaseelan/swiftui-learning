//
//  CustomButton.swift
//  Trackizer
//
//  Created by Packiaseelan S on 30/11/23.
//

import SwiftUI

enum ButtonType {
    case primary, secondary, facebook, google, apple
}

struct CustomButton: View {
    @State var type: ButtonType = .primary
    @State var title: String = "Title"
    var leadingIcon: String?
    var onPressed: (()->())?
    
    var body: some View {
        Button {
            onPressed?()
        } label: {
            ZStack {
                Image(buttonBg)
                    .resizable()
                    .scaledToFill()
                    .padding(.horizontal, 20)
                    .frame(width: .screenWidth, height: 48)
                
                HStack {
                    if leadingIcon != nil {
                        Image(leadingIcon!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                    
                    Text(title)
                        .font(.customfont(.semibold, fontSize: 14))
                }
                .padding(.horizontal, 20)
            }
        }
        .foregroundColor(textColor)
        .shadow(color: shadowColor.opacity(0.3), radius: 5, y: 3)
    }
}

extension CustomButton {
    var buttonBg: String {
        switch type {
        case .primary:
            return "primary_btn"
        case .secondary:
            return "secondary_btn"
        case .facebook:
            return "fb_btn"
        case .google:
            return "google_btn"
        case .apple:
            return "apple_btn"
        }
    }
    
    var shadowColor: Color {
        switch type {
        case .primary, .secondary:
            return .secondaryC
        case .facebook:
            return .blue
        case .apple:
            return .black
        default:
            return .white
        }
    }
    
    var textColor: Color {
        switch type {
        case .google:
            return .grayC
        default:
            return .white
        }
    }
}

#Preview {
    CustomButton()
}
