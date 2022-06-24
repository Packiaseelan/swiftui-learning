//
//  CoinImageService.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 18/06/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName: String = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let image = fileManager.getImage(imageName: imageName, folderName: folderName) {
            self.image = image
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: NetworkingManager.handleCompletion,
                receiveValue: { [weak self] returnedImage in
                    guard
                        let self = self,
                        let image = returnedImage
                    else { return }
                    
                    self.image = image
                    self.fileManager.saveImage(image: image, imageName: self.imageName, folderName: self.folderName)
                    self.imageSubscription?.cancel()
                }
            )
    }
}
