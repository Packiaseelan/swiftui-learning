//
//  AppItemView.swift
//  UIAnimations
//
//  Created by Packiaseelan S on 29/11/22.
//

import SwiftUI

struct AppItemCard: View {
    var item: AppItem
    @State var show = false

    var body: some View {
        HStack(spacing: 15) {
            appIcon
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.name)
                            .font(.title2)
                        
                        Text(item.source)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer(minLength: 10)
                    
                    VStack {
                        getOrOpenButton
                        inAppPurchase
                    }
                }
                
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

struct AppItemCard_Previews: PreviewProvider {
    static var previews: some View {
        AppItemCard(item: tempApps.first!)
            .previewLayout(.sizeThatFits)
    }
}

extension AppItemCard {
    private var appIcon: some View {
        Image(item.name)
            .resizable()
            .frame(width: 65, height: 65)
    }
    
    private var getOrOpenButton: some View {
        Button(action: onGetOrOpen) {
            Text(show ? "Open" : "GET")
                .fontWeight(.heavy)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .background(Color.primary.opacity(0.1))
                .clipShape(Capsule())
        }
    }
    
    private var inAppPurchase: some View {
        Text("In App Purchases")
            .font(.caption2)
            .foregroundColor(.gray)
    }
}

extension AppItemCard {
    private func onGetOrOpen() {
        show.toggle()
    }
}
