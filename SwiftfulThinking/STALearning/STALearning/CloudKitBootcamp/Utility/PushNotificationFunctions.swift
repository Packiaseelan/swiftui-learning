//
//  PushNotificationFunctions.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/11/22.
//

import Foundation
import CloudKit
import Combine
import SwiftUI

// MARK: Push Notification Functions
extension CloudKitUtility {
    
    static func requestAuthorization() -> icBoolFuture {
        Future {
            requestAuthorization(completion: $0)
        }
    }
    
    static func subscribeTo(
        recordType: CKRecord.RecordType,
        subscriptionID: CKSubscription.ID,
        predicate: NSPredicate,
        options: CKQuerySubscription.Options,
        notificationTitle: String?,
        notificationAlertBody: String?,
        notificationSoundName: String?
    ) -> icBoolFuture {
        Future {
            subscribeTo(
                recordType: recordType,
                subscriptionID: subscriptionID,
                predicate: predicate,
                options: options,
                notificationTitle: notificationTitle,
                notificationAlertBody: notificationAlertBody,
                notificationSoundName: notificationSoundName,
                completion: $0
            )
        }
    }
    
    static func unSubscribeFrom(subscriptionID: CKSubscription.ID) -> icBoolFuture {
        Future {
            unSubscribeFrom(subscriptionID: subscriptionID, completion: $0)
        }
    }
    
    static private func requestAuthorization(completion: @escaping icBoolResult) {
        let options = UNAuthorizationOptions([.alert, .badge, .sound])
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                completion(.failure(error))
            } else if success {
                completion(.success(true))
            } else {
                completion(.failure(CloudKitError.iCloudNotificationPermissionFailure))
            }
        }
    }
    
    static private func subscribeTo(
        recordType: CKRecord.RecordType,
        subscriptionID: CKSubscription.ID,
        predicate: NSPredicate,
        options: CKQuerySubscription.Options,
        notificationTitle: String?,
        notificationAlertBody: String?,
        notificationSoundName: String?,
        completion: @escaping icBoolResult
    ) {
        let subscription = CKQuerySubscription(recordType: recordType, predicate: predicate, subscriptionID: subscriptionID, options: options)
        
        let notification = CKSubscription.NotificationInfo()
        notification.title = notificationTitle
        notification.alertBody = notificationAlertBody
        notification.soundName = notificationSoundName
        
        subscription.notificationInfo = notification
        
        CKContainer.default().publicCloudDatabase.save(subscription) { returnedSubscription, returnedError in
            if let error = returnedError {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    static private func unSubscribeFrom(
        subscriptionID: CKSubscription.ID,
        completion: @escaping icBoolResult
    ) {
        CKContainer.default().publicCloudDatabase.delete(withSubscriptionID: subscriptionID) { returnedSubscriptionId, returnedError in
            if let error = returnedError {
                print(error)
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
}
