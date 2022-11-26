//
//  CloudKitPushNotificationBootcampViewModel.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/11/22.
//

import Foundation
import SwiftUI
import Combine

class CloudKitPushNotificationBootcampViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    func requestNotificationPermissions() {
        
        CloudKitUtility.requestAuthorization()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { success in
                if success {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
            .store(in: &cancellables)
    }
    
    func subscribeToNotifications() {
        let predicate = NSPredicate(value: true)
        let recordType = "Fruits"
        let subscriptionID = "fruits_added_database"
        
        CloudKitUtility.subscribeTo(
            recordType: recordType,
            subscriptionID: subscriptionID,
            predicate: predicate,
            options: .firesOnRecordCreation,
            notificationTitle: "There's a new fruit!",
            notificationAlertBody: "Open the app to check the new fruits",
            notificationSoundName: "default")
        .receive(on: DispatchQueue.main)
        .sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        } receiveValue: { success in
            print("Successfully subscribed")
        }
        .store(in: &cancellables)
    }
    
    func unSubscribeToNotifications() {
        
        let subscriptionID = "fruits_added_database"
        
        CloudKitUtility.unSubscribeFrom(subscriptionID: subscriptionID)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { success in
                print("Successfully unsubscribed")
            }
            .store(in: &cancellables)
    }
}
