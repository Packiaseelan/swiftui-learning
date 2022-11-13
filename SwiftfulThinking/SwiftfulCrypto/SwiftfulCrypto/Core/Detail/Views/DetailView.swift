//
//  DetailView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 21/06/22.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    @State var showFullDescription: Bool = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    private let spacing: CGFloat = 30.0
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ChartView(coin: vm.coin)
                DetailGridView(title: "Overview", description: vm.description, stats: vm.overviewStatistics)
                DetailGridView(title: "Additional Information", stats: vm.additionalStatistics)
                websiteSection
            }
            .padding()
        }
        .background(
            Color.theme.background
                .ignoresSafeArea()
        )
        .navigationTitle(vm.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItem
            }
        }
    }
    
    private func onReadMore() {
        withAnimation(.easeInOut) {
            showFullDescription.toggle()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}

extension DetailView {
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            
            CoinImageView(coin: vm.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var titleView: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let websiteString = vm.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            if let subredditString = vm.subredditURL,
               let url = URL(string: subredditString) {
                Link("Reddit", destination: url)
            }
        }
        .accentColor(.blue)
        .font(.headline)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
}
