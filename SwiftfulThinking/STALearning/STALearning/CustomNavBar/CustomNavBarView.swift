//
//  CustomNavBarView.swift
//  STALearning
//
//  Created by Packiaseelan S on 20/08/22.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let showBackButton: Bool
    let title: String
    let subTitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(
                showBackButton: true,
                title: "Title here",
                subTitle: "Subtitle goes here."
            )
            Spacer()
        }
    }
}

extension CustomNavBarView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subTitle = subTitle {
                Text(subTitle)
            }
            
        }
    }
}
