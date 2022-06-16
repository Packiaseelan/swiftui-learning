//
//  CoinListView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 16/06/22.
//

import SwiftUI

struct CoinListView: View {
    let coins: [CoinModel]
    let showHoldings: Bool
    var body: some View {
        List {
            ForEach(coins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: showHoldings)
                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinListView(coins: dev.coins, showHoldings: false)
                .previewLayout(.sizeThatFits)
            
            CoinListView(coins: dev.coins, showHoldings: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        .frame(height: 150)
    }
}
