//
//  FutureBootcampViewModel.swift
//  STALearning
//
//  Created by Packiaseelan S on 13/11/22.
//

import Foundation
import Combine

class FuturesBootcampViewModel: ObservableObject {
    @Published var title: String = "Starting title"
    let url = URL(string: "https://www.google.com")!
    var cancellables = Set<AnyCancellable>()
    
    init() {
         download()
    }
    
    func download() {
//        getCombinePublisher()
//            .sink { _ in
//
//            } receiveValue: { [weak self] returnedValue in
//                self?.title = returnedValue
//            }
//            .store(in: &cancellables)
        
//        getEscapingClosure { [weak self] returnedValue, error in
//            self?.title = returnedValue
//        }
        
        getFuturePublisher()
            .sink { _ in
            } receiveValue: { [weak self] returnedValue in
                DispatchQueue.main.async {
                    self?.title = returnedValue
                }
            }
            .store(in: &cancellables)
    }
    
    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in
                return "New value"
            })
            .eraseToAnyPublisher()
    }
    
    func getEscapingClosure(completionHandler: @escaping (_ value: String, _ error: Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completionHandler("New value 2", nil)
        }.resume()
    }
    
    func getFuturePublisher() -> Future<String, Error> {
        Future { promise in
            self.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnedValue))
                }
            }
        }
    }
    
//    func doSomething(completion: @escaping (_ value: String) -> ()) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            completion("New String")
//        }
//    }
//
//    func doSomethingFuture() -> Future<String, Never> {
//        Future { promise in
//            self.doSomething { value in
//                promise(.success(value))
//            }
//        }
//    }
}
