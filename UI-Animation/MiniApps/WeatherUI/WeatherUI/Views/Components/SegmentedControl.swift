//
//  SegmentedControl.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct SegmentedControl: View {
    
    @Binding var selection: Int
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                hourlyButton
                weeklyButton
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
            
            separator
        }
        .padding(.top, 25)
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(selection: .constant(0))
            .background(Color.background)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}

extension SegmentedControl {
    private var hourlyButton: some View {
        Button {
            onSegmentedChange(index: 0)
        } label: {
            Text("Hourly Forecast")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    private var weeklyButton: some View {
        Button {
            onSegmentedChange(index: 1)
        } label: {
            Text("Weekly Forecast")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    private var underline: some View {
        HStack {
            Divider()
                .frame(width: UIScreen.main.bounds.size.width / 2, height: 3)
                .background(Color.underline)
            .blendMode(.overlay)
        }
        .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
        .offset(y: -1)
    }
    
    private var separator: some View {
        Divider()
            .background(.white.opacity(0.5))
            .blendMode(.overlay)
            .shadow(color: .black.opacity(0.2), radius: 0, x: 0, y: 1)
            .blendMode(.overlay)
            .overlay(underline)
    }
}

extension SegmentedControl {
    private func onSegmentedChange(index: Int) {
        withAnimation(.easeOut(duration: 0.5)) {
            selection = index
        }
    }
}
