//
//  PortfolioView.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 20/06/22.
//

import SwiftUI

struct PortfolioView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: HomeViewModel
    @State var selectedCoin: CoinModel? = nil
    @State var quantityText: String = ""
    @State var showCheckMark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .background(Color.theme.background.ignoresSafeArea())
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    closeButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButton
                }
            }
            .onChange(of: vm.searchText) { newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(vm.searchText.isEmpty ? vm.portfolioCoins : vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture(perform: {
                            updateSelectedCoin(coin: coin)
                        })
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    selectedCoin?.id == coin.id ? Color.theme.green : Color.clear,
                                    lineWidth: 1
                                )
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        }
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Currenr price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            Divider()
            
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField("Ex: 1.2", text: $quantityText)
                    .multilineTextAlignment(.trailing)
            }
            Divider()
            
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .animation(.none, value: selectedCoin?.id ?? "")
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1 : 0)
            
            Button {
                saveButtonPressed()
            } label: {
                Text("save".uppercased())
            }
            .opacity(
                (selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText))
                ? 1 : 0
            )
        }
        .font(.headline)
    }
    
    private var closeButton: some View {
        Image(systemName: "xmark")
            .font(.headline)
            .onTapGesture(perform: onPressed)
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private func saveButtonPressed() {
        guard
            let coin = selectedCoin,
            let amount = Double(quantityText)
        else { return }
        
        //save portfolio
        vm.updatePortfolio(coin: coin, amount: amount)
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
    
    private func onPressed() {
        presentationMode.wrappedValue.dismiss()
    }
    
    private func updateSelectedCoin(coin: CoinModel) {
        withAnimation(.easeIn) {
            selectedCoin = coin
            if
                let portfolioCoin = vm.portfolioCoins.first(where: {$0.id == coin.id}),
                let amount = portfolioCoin.currentHoldings {
                quantityText = "\(amount)"
            } else {
                quantityText = ""
            }
        }
    }
}
