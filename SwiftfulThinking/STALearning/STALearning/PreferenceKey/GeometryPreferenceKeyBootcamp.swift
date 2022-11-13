//
//  GeometryPreferenceKeyBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 14/07/22.
//

import SwiftUI

struct GeometryPreferenceKeyBootcamp: View {
    
    @State var rectSize: CGSize = .zero
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            
            Spacer()
            
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)
                }
                Rectangle()
            }
            .frame(height: 55)
        }
        .padding(.vertical)
        .onPreferenceChange(RectangleSizePreferenceKey.self) { value in
            rectSize = value
        }
        
    }
}

struct GeometryPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootcamp()
    }
}


struct RectangleSizePreferenceKey: PreferenceKey {
    
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View{
        preference(key: RectangleSizePreferenceKey.self, value: size)
    }
}
