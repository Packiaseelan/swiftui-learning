//
//  AdvancedCombineDataService.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/10/22.
//

import Foundation
import Combine

class AdvancedCombineDataService {
//    @Published var basicPublisher: String = ""
//    let currentValuePublisher = CurrentValueSubject<String, Never>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublishers = PassthroughSubject<Bool, Error>()
    let intPublishers = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    
    private func publishFakeData() {
//        let items = ["one", "two", "three"]
        let items: [Int] = [1,2,3,4,5,6,7,8,9,10]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
//                self.basicPublisher = items[x]
//                self.currentValuePublisher.send(items[x])
                self.passThroughPublisher.send(items[x])
                
                if (x > 4) && (x < 8) {
                    self.boolPublishers.send(true)
                    self.intPublishers.send(999)
                } else {
                    self.boolPublishers.send(false)
                }

                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
//            self.passThroughPublisher.send(1)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.passThroughPublisher.send(2)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.passThroughPublisher.send(3)
//        }
        
    }
}
