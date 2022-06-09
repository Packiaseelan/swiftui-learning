//
//  DownloadingImagesViewModel.swift
//  STCLearning
//
//  Created by Packiaseelan S on 08/06/22.
//

import Foundation
import Combine

class DownloadingImagesViewModel: ObservableObject {
    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photos
            .sink { [weak self] photos in
                self?.dataArray = photos
            }
            .store(in: &cancellables)
    }
}
