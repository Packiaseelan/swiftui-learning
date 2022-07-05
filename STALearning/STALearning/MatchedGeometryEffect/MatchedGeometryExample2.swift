//
//  MatchedGeometryExample2.swift
//  STALearning
//
//  Created by Packiaseelan S on 05/07/22.
//

import SwiftUI

struct MatchedGeometryExample2: View {
    
    private var categories: [String] = [ "Home", "Popular", "Saved" ]
    
    @State private var selected: String = ""
    @Namespace private var namespace2
    
    var body: some View {
        VStack {
            HStack {
                ForEach(categories, id: \.self) { category in
                    ZStack(alignment: .bottom) {
                        if selected == category {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.red)
                                .matchedGeometryEffect(id: "category_background", in: namespace2)
                                .frame(width: 35, height: 2)
                                .offset(y: 10)
                        }
                        Text(category)
                            .foregroundColor(category == selected ? .red : .black)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selected = category
                        }
                    }
                }
            }
            .padding()
            Spacer()
        }
    }
}

struct MatchedGeometryExample2_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryExample2()
    }
}
