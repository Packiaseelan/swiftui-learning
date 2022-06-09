//
//  PhotoModelDataService.swift
//  STCLearning
//
//  Created by Packiaseelan S on 08/06/22.
//

import Foundation
import Combine

class PhotoModelDataService {
    
    @Published var photos: [PhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    static var instance = PhotoModelDataService()
    private init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data, \(error)")
                    
                }
            } receiveValue: { [weak self] receivedPhotos in
                self?.photos = receivedPhotos
            }
            .store(in: &cancellables)

    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
