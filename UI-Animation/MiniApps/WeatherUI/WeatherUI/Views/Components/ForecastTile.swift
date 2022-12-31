//
//  ForecastTile.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 29/12/22.
//

import SwiftUI

struct ForecastTile: View {
    
    let icon: String
    let title: String
    let detail: String
    let description: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.bottomSheetBackground)
            .overlay(border)
            .overlay (alignment: .leading, content: {
                VStack(alignment: .leading) {
                    HStack(spacing: 5) {
                        Image(systemName: icon)
                        Text(title)
                    }
                    .font(.subheadline.weight(.semibold))
                    .foregroundColor(.secondary)
                    
                    Text(detail)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .padding(.top, 5)
                    
                    Spacer()
                    Text(description)
                        .font(.caption)
                        .foregroundColor(.primary)
                }
                .padding()
            })
            .frame(width: .infinity, height: 158)
    }
}

struct ForecastTile_Previews: PreviewProvider {
    static var previews: some View {
        ForecastTile(icon: "eye.fill", title: "VISIBILITY", detail: "19°", description: "Similar to the actual temperature.")
            .padding()
            .background(Color.bottomSheetBackground)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

extension ForecastTile {
    private var border: some View {
        RoundedRectangle(cornerRadius: 20)
            .strokeBorder(.white.opacity(0.1))
    }
}
