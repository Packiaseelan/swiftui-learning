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
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            // Content
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTitle
                
                if !showPortfolio {
                    CoinListView(coins: vm.allCoins, showHoldings: false)
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    CoinListView(coins: vm.portfolioCoins, showHoldings: true)
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
        }
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
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
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
        }
    }
    
    private func onReload() {
        withAnimation(.linear(duration: 2)) {
            vm.reloadData()
        }
    }
    
}
