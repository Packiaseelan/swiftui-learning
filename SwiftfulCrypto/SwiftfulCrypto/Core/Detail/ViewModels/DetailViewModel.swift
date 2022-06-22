//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 21/06/22.
//

import Combine

class DetailViewModel: ObservableObject {
    
    @Published var coin: CoinModel
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    @Published var description: String?
    @Published var websiteURL: String?
    @Published var subredditURL: String?
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinDetailService = CoinDetailDataService(coin: coin)
        addSubscriptions()
    }
    
    private func addSubscriptions() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDetailsToStats)
            .sink { [weak self] returnedArrays in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailService.$coinDetails
            .sink { [weak self] details in
                guard let self = self,
                      let details = details
                else { return }
                self.description = details.readableDescription
                self.websiteURL = details.links?.homepage?.first
                self.subredditURL = details.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    private func mapDetailsToStats(coinDetails: CoinDetailModel?, coin: CoinModel) -> (overview: [StatisticModel], additional: [StatisticModel]) {
        let overview = createOverview(coin: coin)
        let additional = createAdditional(coinDetails: coinDetails, coin: coin)
        
        return (overview, additional)
    }
    
    private func createOverview(coin: CoinModel) -> [StatisticModel] {
        // overview
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStat = StatisticModel(title: "Current Price", value: price, percentageChange: pricePercentChange)
        
        let marketCap = (coin.marketCap?.asCurrencyWith6Decimals() ?? "")
        let marketCapChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap, percentageChange: marketCapChange)
        
        let rank = "\(coin.rank)"
        let rankStat = StatisticModel(title: "Rank", value: rank)
        
        let volume = "$" + (coin.totalVolume?.asCurrencyWith6Decimals() ?? "")
        let VolumeStat = StatisticModel(title: "Volume", value: volume)
        
        return [
            priceStat, marketCapStat, rankStat, VolumeStat
        ]
    }
    
    private func createAdditional(coinDetails: CoinDetailModel?, coin: CoinModel) -> [StatisticModel] {
        let high = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = StatisticModel(title: "24h High", value: high)
        
        let low = coin.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = StatisticModel(title: "24h Low", value: low)
        
        let priceChange = coin.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24h Price Change", value: priceChange, percentageChange: pricePercentChange)
        
        let marketCapChange = (coin.marketCapChange24H?.asCurrencyWith6Decimals() ?? "")
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapPercentChange)
        
        let blockTime = coinDetails?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = StatisticModel(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetails?.hashingAlgorithm ?? ""
        let hashingStat = StatisticModel(title: "Hashing Algorithm", value: hashing)
        
        return [
            highStat, lowStat, priceChangeStat, marketCapStat, blockStat, hashingStat
        ]
    }
    
    
}
