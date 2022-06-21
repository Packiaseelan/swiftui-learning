//
//  CoinLogoView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 20/06/22.
//

import SwiftUI

struct CoinLogoView: View {
    let coin: CoinModel
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            
            Text(coin.name)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
    }
}

struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinLogoView(coin: dev.coin)
            
            CoinLogoView(coin: dev.coin)
                .preferredColorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}
