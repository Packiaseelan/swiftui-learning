//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 10/06/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State var showPortfolio: Bool = false
    @State var showPortfolioView: Bool = false
    @State var showSettingsView: Bool = false
    
    @State var selectedCoin: CoinModel? = nil
    @State var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .fullScreenCover(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            
            // Content
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitle
                
                if !showPortfolio {
                    List {
                        ForEach(vm.allCoins) { coin in
                            CoinRowView(coin: coin, showHoldingColumn: false)
                                .onTapGesture { navigateToDetail(coin: coin) }
                                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    List {
                        ForEach(vm.portfolioCoins) { coin in
                            CoinRowView(coin: coin, showHoldingColumn: true)
                                .onTapGesture { navigateToDetail(coin: coin) }
                                .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                        }
                    }
                    .listStyle(PlainListStyle())
                    .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
            .fullScreenCover(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: { EmptyView() }
            )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
                .onTapGesture(perform: onLeftButtonClicked)
                .animation(.none, value: showPortfolio)
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture(perform: onRightButtonClicked)
        }
        .padding(.horizontal)
    }
    
    private var columnTitle: some View {
        HStack {
            TitleView(title: "Coin", imageName: "chevron.down",
                      opacity: vm.sortOption == .rank || vm.sortOption == .rankReversed ? 1 : 0,
                      rotation: vm.sortOption == .rank ? 0 : 180)
                .onTapGesture(perform: onCoinSort)
            
            Spacer()
            
            if showPortfolio {
                TitleView(title: "Holdings", imageName: "chevron.down",
                          opacity: vm.sortOption == .holdings || vm.sortOption == .holdingsReversed ? 1 : 0,
                          rotation: vm.sortOption == .holdings ? 0 : 180)
                    .onTapGesture(perform: onHoldingsSort)
            }
            
            TitleView(title: "Price", imageName: "chevron.down",
                      opacity: vm.sortOption == .price || vm.sortOption == .priceReversed ? 1 : 0,
                      rotation: vm.sortOption == .price ? 0 : 180)
                .onTapGesture(perform: onPriceSort)
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            
            Button(action: onReload) {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0))
        }
        .padding(.horizontal)
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
    }
}

// HomeView actions
extension HomeView {
    
    private func onRightButtonClicked() {
        withAnimation(.spring()) {
            showPortfolio.toggle()
        }
    }
    
    private func onLeftButtonClicked() {
        if showPortfolio {
            showPortfolioView.toggle()
        } else {
            showSettingsView.toggle()
        }
    }
    
    private func onReload() {
        withAnimation(.linear(duration: 2)) {
            vm.reloadData()
        }
    }
    
    private func onCoinSort() {
        withAnimation(.default) {
            vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
        }
    }
    
    private func onHoldingsSort() {
        withAnimation(.default) {
            vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
        }
    }
    
    private func onPriceSort() {
        withAnimation(.default) {
            vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
        }
    }
    
    private func navigateToDetail(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
    
}

struct TitleView: View {
    let title: String
    let imageName: String
    let opacity: Double
    let rotation: Double
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            Image(systemName: imageName)
                .opacity(opacity)
                .rotationEffect(Angle(degrees: rotation))
        }
    }
}
