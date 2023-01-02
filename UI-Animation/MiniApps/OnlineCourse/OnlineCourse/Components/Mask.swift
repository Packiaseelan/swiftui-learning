//
//  Mask.swift
//  OnlineCourse
//
//  Created by Packiaseelan S on 02/01/23.
//

import SwiftUI

struct Mask: View {
    let cornerRadius: CGFloat
    
    init(cornerRadius: CGFloat? = nil) {
        self.cornerRadius = cornerRadius ?? 30
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
    }
}

struct Mask_Previews: PreviewProvider {
    static var previews: some View {
        Mask()
    }
}
