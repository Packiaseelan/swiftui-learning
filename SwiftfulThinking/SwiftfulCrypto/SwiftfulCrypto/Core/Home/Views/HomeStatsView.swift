//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 19/06/22.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeStatsView(showPortfolio: .constant(false))
                .environmentObject(dev.homeVM)
            
            HomeStatsView(showPortfolio: .constant(true))
                .environmentObject(dev.homeVM)
        }
        .previewLayout(.sizeThatFits)
    }
}
