//
//  CustomSlider.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct CustomSlider: View {
    
    @Binding var value: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                line
                
                arrow
                    // since drag point size is 45
                    .offset(x: value * (geo.frame(in: .global).width - 45))
                    .gesture(DragGesture().onChanged({ (value) in
                        onSliderDrag(value: value, geo: geo)
                    }))
            }
        }
        .padding()
        .frame(height: 45)
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(value: .constant(0.5))
            .padding(.bottom)
            .previewLayout(.sizeThatFits)
    }
}

extension CustomSlider {
    private var line: some View {
        Color.black
            .frame(height: 2)
    }
    
    private var arrow: some View {
        Image(systemName: "arrow.right")
            .font(.title2)
            .foregroundColor(.white)
            .frame(width: 45, height: 45)
            .background(Color.black)
            .cornerRadius(5)
    }
}

extension CustomSlider {
    private func onSliderDrag(value: DragGesture.Value, geo: GeometryProxy) {
        let width = geo.frame(in: .global).width - 45
        // since horizontal padding = 30
        let drag = value.location.x - 30
        
        // Limiting Drag
        if drag > 0 && drag <= width {
            self.value = drag / width
        }
    }
}
