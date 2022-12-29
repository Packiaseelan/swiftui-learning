//
//  ForecastCard.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: Forecast
    var forecastPeriod: ForecastPeriod
    var isActive: Bool {
        if forecastPeriod == .hourly {
            let isHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isHour
        } else {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            return isToday
        }
    }
    
    var body: some View {
        ZStack {
            cardShape
                .overlay(cardBorder)
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            VStack(spacing: 16) {
                
                Text(forecast.date, format: forecastPeriod == .hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                
                VStack(spacing: -4) {
                    Image("\(forecast.icon) small")
                    
                    Text(forecast.probability, format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probability > 0 ? 1 : 0)
                }
                .frame(height: 42)
                
                Text("\(forecast.temperature)°")
                    .font(.title3)
                
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 60, height: 146)
        }
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(forecast: Forecast.hourly[1], forecastPeriod: .hourly)
            .padding()
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}

extension ForecastCard {
    private var cardShape: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
            .frame(width: 60, height: 146)
            .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
    }
    
    private var cardBorder: some View {
        RoundedRectangle(cornerRadius: 30)
            .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
            .blendMode(.overlay)
    }
}
