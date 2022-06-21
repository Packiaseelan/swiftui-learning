//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 16/06/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // update coins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] allCoins in
                self?.allCoins = allCoins
            }
            .store(in: &cancellables)
        
        // update portfolio
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapPortfolioData)
            .sink { [weak self] coins in
                self?.portfolioCoins = coins
            }
            .store(in: &cancellables)
        
        // update stats
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(mapMarketData)
            .sink { [weak self] stats in
                self?.statistics = stats
                self?.isLoading = false
            }
            .store(in: &cancellables)
        
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let loweredCaseText = text.lowercased()
        
        return allCoins.filter { coin -> Bool in
            coin.name.lowercased().contains(loweredCaseText) ||
            coin.symbol.lowercased().contains(loweredCaseText) ||
            coin.id.lowercased().contains(loweredCaseText)
        }
    }
    
    private func mapMarketData(marketData: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = marketData else {
            return stats
        }
        
        let portfolioValues =
            portfolioCoins
                .map({ $0.currentHoldingsValue })
                .reduce(0, +)
        
        let previousValues: Double =
            portfolioCoins
                .map(mapCoins)
                .reduce(0, +)
                
        
        let percentage  = ((portfolioValues - previousValues) / previousValues ) * 100
        
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "Volume", value: data.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: portfolioValues.asCurrencyWith2Decimals(), percentageChange: percentage)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        
        return stats
    }
    
    private func mapPortfolioData(coins: [CoinModel], entities: [PortfolioEntity]) -> [CoinModel] {
        return coins.compactMap { (coin) -> CoinModel? in
            guard let entity = entities.first(where: {$0.coinId == coin.id})  else{
                return nil
            }
            return coin.updateHoldings(amount: entity.amount)
        }
    }
    
    private func mapCoins(coin: CoinModel) -> Double {
        let currentValue = coin.currentHoldingsValue
        let percentageChange = (coin.priceChangePercentage24H ?? 0) / 100
        let previousValue = currentValue / (1 + percentageChange)
        return previousValue
    }
}
