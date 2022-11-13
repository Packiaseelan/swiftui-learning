//
//  AdvancedCombineBootcampViewModel.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/10/22.
//

import Foundation
import Combine

class AdvancedCombineBootcampViewModel: ObservableObject {
    @Published var data: [String] = []
    @Published var dataBools: [Bool] = []
    @Published var error: String = ""
    let dataService = AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addPublishers()
    }
    
    private func addPublishers() {
//        dataService.$basicPublisher
//        dataService.currentValuePublisher
//        dataService.passThroughPublisher
        
        // Sequence Operations
        /*
//            .first()
//            .first(where: { $0 > 4 })
//            .tryFirst(where: {
//                if $0 == 3 {
//                    throw URLError(.badServerResponse)
//                }
//                return $0 > 1
//            })
        
//            .last()
//            .last(where: { $0 > 4})
//            .tryLast(where: {
//                if $0 == 13 {
//                    throw URLError(.badServerResponse)
//                }\
//                return $0 > 1
//            })
        
//            .dropFirst()
//            .dropFirst(5)
//            .drop(while: { $0 > 4 })
//            .tryDrop(while: {
//                if $0 == 13 {
//                   throw URLError(.badServerResponse)
//               }
//               return $0 > 1
//            })
            
//            .prefix(4)
//            .prefix(while: { $0 < 5 })
        
//            .output(at: 3)
            .output(in: 3..<5)
        
        */
        
        // Mathematic Operations
        /*
//            .max()
//            .max(by: { $0 < $1 })
//            .tryMax(by: {})
//            .min()
//            .min(by: { $0 < $1 })
//            .tryMin(by: )
        
        */
        
        // Filtering / Reducing Operations
        /*
//            .map { String($0) }
//            .tryMap({
//                if $0 == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return String($0)
//            })
//            .compactMap({
//                if $0 == 5 {
//                    return nil
//                }
//                return String($0)
//            })
//            .tryCompactMap()
//            .filter({ ($0 > 3) && ($0 < 7) })
//            .tryFilter()
//            .removeDuplicates()
//            .removeDuplicates(by: { $0 == $1 })
//            .tryRemoveDuplicates(by: )
//            .replaceNil(with: 5)
//            .replaceEmpty(with: [])
//            .replaceError(with: "DEFAULT VALUE")
//            .scan(0, { $0 + $1 })
//            .scan(0, +)
//            .tryScan()
//            .reduce(0, { $0 + $1 })
//            .reduce(0, +)
//            .collect()
//            .collect(3)
//            .allSatisfy({ $0 > 50 })
//            .tryAllSatisfy()
         */
        
        // Timing Operations
        /*
//            .debounce(for: 0.75, scheduler: DispatchQueue.main)
//            .delay(for: 2, scheduler: DispatchQueue.main)
//            .measureInterval(using: DispatchQueue.main)
//            .map({stride in
//                return "\(stride.timeInterval)"
//            })
//            .throttle(for: 5, scheduler: DispatchQueue.main, latest: true)
//            .retry(2)
//            .timeout(0.75, scheduler: DispatchQueue.main)
        */
        
        // Multiple Publishers / Subscribers
        /*
//            .combineLatest(dataService.boolPublishers, dataService.intPublishers)
//            .compactMap({ $1 ? String($0) : nil})
//            .compactMap({ int1, bool, int2 in
//                if bool {
//                    return String(int1)
//                }
//                return "n/a"
//            })
//            .merge(with: dataService.intPublishers)
//            .zip(dataService.boolPublishers, dataService.intPublishers)
//            .map({ tuple in
//                return String(tuple.0) + tuple.1.description + String(tuple.2)
//            })
//            .tryMap({ int in
//                if int == 5 {
//                    throw URLError(.badServerResponse)
//                }
//                return int
//            })
//            .catch({ error in
//                return self.dataService.intPublishers
//            })
         */
        
        let sharedPublishers = dataService.passThroughPublisher
            .dropFirst(5)
            .share()
        
        sharedPublishers
            .map { String($0) }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                    print("ERROR: \(error)")
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
//                self?.data = returnedValue
//                self?.data.append(contentsOf: returnedValue)
            }
            .store(in: &cancellables)
        
        sharedPublishers
            .map { $0 > 5 ? true : false }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error.localizedDescription
                    print("ERROR: \(error)")
                }
            } receiveValue: { [weak self] returnedValue in
                self?.dataBools.append(returnedValue)
            }
            .store(in: &cancellables)

    }
}
