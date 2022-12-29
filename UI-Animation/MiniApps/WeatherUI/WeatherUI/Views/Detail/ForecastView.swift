//
//  ForecastView.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    
    @State private var selection: Int = 0
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                SegmentedControl(selection: $selection)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly) { hour in
                                ForecastCard(forecast: hour, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -UIScreen.main.bounds.width))
                        } else {
                            ForEach(Forecast.daily) { daily in
                                ForecastCard(forecast: daily, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: UIScreen.main.bounds.width))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProrated)
        .overlay(bottomSheetSeparator)
        .overlay(bottomSheetDragIndicator)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}

extension ForecastView {
    private var bottomSheetSeparator: some View {
        Divider()
            .blendMode(.overlay)
            .background(Color.bottomSheetBorderTop)
            .frame(maxHeight: .infinity, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 44))
    }
    
    private var bottomSheetDragIndicator: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black.opacity(0.3))
            .frame(width: 48, height: 5)
            .frame(height: 20)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
