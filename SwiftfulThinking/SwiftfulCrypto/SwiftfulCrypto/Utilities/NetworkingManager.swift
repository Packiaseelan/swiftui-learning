//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Packiaseelan S on 16/06/22.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badUrlResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badUrlResponse(url: let url):
                return "Bad response from url: \(url)"
            case .unknown:
                return "unknown error occured."
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .background))   // automatically on background thread
            .tryMap({try handleURLResponse(output: $0, url: url)})
            // removed from here
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    private static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode <= 200 && response.statusCode < 300 else {
            throw NetworkingError.badUrlResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error)
            break
        }
    }
}
