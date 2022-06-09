//
//  ImageLoadingViewModel.swift
//  STCLearning
//
//  Created by Packiaseelan S on 09/06/22.
//

import Foundation
import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    var cancellables = Set<AnyCancellable>()
    let manager = PhotoModelFileManager.instance
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    func getImage() {
        if let storedImage = manager.get(key: imageKey) {
            image = storedImage
            print("get image form cache")
        } else {
            downloadImage()
            print("download image from internet")
        }
    }
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returned in
                guard
                    let self = self,
                    let img = returned else { return }
                self.image = img
                self.manager.add(key: self.imageKey, value: img)
                
            }
            .store(in: &cancellables)
    }
}
