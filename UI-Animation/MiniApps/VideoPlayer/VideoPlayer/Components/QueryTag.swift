//
//  QueryTag.swift
//  VideoPlayer
//
//  Created by Packiaseelan S on 30/12/22.
//

import SwiftUI

struct QueryTag: View {
    
    let query: Query
    let isSelected: Bool
    
    var body: some View {
        Text(query.rawValue)
            .font(.caption.weight(.bold))
            .foregroundColor(isSelected ? .primary : .secondary)
            .padding(10)
            .background(.thinMaterial)
            .cornerRadius(10)
        
    }
}

struct QueryTag_Previews: PreviewProvider {
    static var previews: some View {
        QueryTag(query: .nature, isSelected: false)
    }
}
