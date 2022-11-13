//
//  MatchedGeometryExample1.swift
//  STALearning
//
//  Created by Packiaseelan S on 05/07/22.
//

import SwiftUI

struct MatchedGeometryExample1: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)
            }
            Spacer()
            
            if isClicked {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 300, height: 200)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.spring()){
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryExample1_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryExample1()
    }
}
