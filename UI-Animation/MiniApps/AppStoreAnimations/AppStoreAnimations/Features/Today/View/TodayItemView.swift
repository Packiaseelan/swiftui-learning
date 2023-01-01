//
//  TodayItemView.swift
//  AppStoreAnimations
//
//  Created by Packiaseelan S on 10/12/22.
//

import SwiftUI

struct TodayItemView: View {
    
    let item: TodayModel
    
    @EnvironmentObject var today: TodayViewModel
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        GeometryReader { geo -> AnyView in
            AnyView(
                ZStack(alignment: .leading) {
                    bgImage
                    detail
                }
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .scaleEffect(isPressed ? 0.95: 1)
                    .simultaneousGesture(
                        TapGesture()
                            .onEnded({ _ in
                                onPressed(isPressed: true)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                                    onPressed(isPressed: false, geo: geo)
                                })
                            })
                    )
            )
        }
        .background(Color.clear.opacity(0.4))
        .frame(height: today.itemHeight)
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct TodayItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodayItemView(item: todayItems[0])
            .environmentObject(TodayViewModel())
            .previewLayout(.sizeThatFits)
    }
}

extension TodayItemView {
    private var bgImage: some View {
        Image(item.image)
            .resizable()
            .scaledToFill()
            .frame(width: today.SVWidth, height: today.itemHeight)
            .clipped()
            .background(Color.white)
    }
    
    private var detail: some View {
        VStack(alignment: .leading) {
            Text("\(item.subtitle)")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.init(white: 0.8)).opacity(0.6)
            
            Text("\(item.name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(item.shortDescription)
                .lineLimit(1)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.init(white: 0.9)).opacity(0.8)
                
        }
        .padding()
    }
}

extension TodayItemView {
    private func onItemSelect(geo: GeometryProxy) {
        today.selectedItem = item
        let x = geo.frame(in: .global).minX
        let y = geo.frame(in: .global).minY
        let thisRect = CGRect(x: x, y: y,
                              width: today.SVWidth,
                              height: today.itemHeight)
        today.detailsReturnPoint = thisRect
        today.detailsStartPoint = thisRect
        
        showDetails()
    }
    
    private func showDetails() {
        let startPoint = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        withAnimation(.spring(response: 0.55, dampingFraction: 1)) {
            today.showDetails(startPoint: startPoint)
        }
    }
    
    private func onPressed(isPressed: Bool, geo: GeometryProxy? = nil) {
        withAnimation(.easeInOut) {
            self.isPressed = isPressed
            
            if !isPressed {
                onItemSelect(geo: geo!)
            }
        }
    }
}
