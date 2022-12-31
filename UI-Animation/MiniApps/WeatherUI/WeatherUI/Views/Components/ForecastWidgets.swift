//
//  ForecastWidgets.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 29/12/22.
//

import SwiftUI

struct ForecastWidgets: View {
    var body: some View {
        VStack(spacing: 20) {
            ForecastTile(icon: "circle.hexagongrid.fill", title: "AIR QUALIRT", detail: "", description: "")
            
            HStack(spacing: 25) {
                ForecastTile(icon: "sun.max.fill", title: "UV INDEX", detail: "4", description: "")
                ForecastTile(icon: "sunrise.fill", title: "SUNRISE", detail: "5:28 AM", description: "Sunset: 6:30 PM")
            }
            
            HStack(spacing: 25) {
                ForecastTile(icon: "wind", title: "WIND", detail: "", description: "")
                ForecastTile(icon: "drop.fill", title: "RAINFALL", detail: "1.8 mm", description: "")
            }
            
            HStack(spacing: 25) {
                ForecastTile(icon: "thermometer.medium", title: "FEELS LIKE", detail: "19°", description: "Similar to the actual temperature.")
                ForecastTile(icon: "humidity.fill", title: "HUMIDITY", detail: "90%", description: "The dew point is 17 rightnow.")
            }
            
            HStack(spacing: 25) {
                ForecastTile(icon: "eye.fill", title: "VISIBILITY", detail: "8 km", description: "Similar to the actual temperature.")
                ForecastTile(icon: "gauge.medium", title: "PRESSURE", detail: "", description: "")
            }
        }
        .padding(.horizontal, 25)
    }
}

struct ForecastWidgets_Previews: PreviewProvider {
    static var previews: some View {
        ForecastWidgets()
            .preferredColorScheme(.dark)
    }
}

