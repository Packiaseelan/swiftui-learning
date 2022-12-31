//
//  TabBar.swift
//  WeatherUI
//
//  Created by Packiaseelan S on 28/12/22.
//

import SwiftUI

struct TabBar: View {
    
    var action: () -> Void
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height: 88)
                .overlay {
                    Arc()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }

            
            HStack {
                Button {
                    action()
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                NavigationLink {
                    WeatherView()
                } label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }


            }
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 20, leading: 32, bottom: 24, trailing: 32))
            
            BottomAction()
                .fill(Color.background)
                .frame(width: 258, height: 100, alignment: .leading)
                .overlay {
                    BottomAction()
                        .stroke(Color.tabBarBorder, lineWidth: 0.5)
                }
                .overlay(addButton)
            
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(action: {})
            .preferredColorScheme(.dark)
    }
}

extension TabBar {
    private var addButton: some View {
        Circle()
            .fill(Color.forecastCardBackground)
            .shadow(color: .white.opacity(0.5), radius: 5, x: -5, y: -5)
            .blendMode(.overlay)
            .shadow(color: .black.opacity(0.5), radius: 5, x: 5, y: 5)
            .blendMode(.overlay)
            .overlay(outerShadow)
            .overlay(innerCircle)
            .padding()
    }
    
    private var innerCircle: some View {
        Circle()
            .fill(Color.white)
            .overlay(innerShadow)
            .overlay(plusIcon)
            .padding(5)
            .innerShadow(shape: Circle(), color: .black, lineWidth: 5, blur: 5, blendMode: .overlay, opacity: 1)
    }
    
    private var plusIcon: some View {
        Image(systemName: "plus")
            .frame(width: 44, height: 44)
            .font(.largeTitle.weight(.bold))
            .foregroundColor(Color.forecastCardBackground)
    }
    
    private var innerShadow: some View {
        Circle()
            .fill(.white)
            .padding(3)
            .shadow(color: .black.opacity(0.1), radius: 20, x: 15, y: 25)
    }
    
    private var outerShadow: some View {
        Circle()
            .fill(Color.addGray)
    }
}
