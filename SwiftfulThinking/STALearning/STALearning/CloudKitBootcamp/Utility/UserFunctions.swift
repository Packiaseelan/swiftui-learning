//
//  UserFunctions.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/11/22.
//

import Foundation
import Combine
import CloudKit

// MARK: User Functions
extension CloudKitUtility {
    
    static func getiCloudStatus() -> icBoolFuture {
        Future {
            getiCloudStatus(completion: $0)
        }
    }
    
    static func requestApplicationPermission() -> icBoolFuture {
        Future {
            requestApplicationPermission(completion: $0)
        }
    }
    
    static func discoverUserIdentity() -> icStringFuture {
        Future {
            discoverUserIdentity(completion: $0)
        }
    }
    
    static private func getiCloudStatus(completion: @escaping icBoolResult) {
        CKContainer.default().accountStatus {  returnedStatus, returnedError in
            switch returnedStatus {
            case .available:
                completion(.success(true))
            case .noAccount:
                completion(.failure(CloudKitError.iCloudAccountNotFound))
            case .couldNotDetermine:
                completion(.failure(CloudKitError.iCloudAccountNotDetermined))
            case .restricted:
                completion(.failure(CloudKitError.iCloudAccountRestricted))
            default:
                completion(.failure(CloudKitError.iCloudAccountUnknown))
            }
        }
    }
    
    static private func requestApplicationPermission(completion: @escaping icBoolResult) {
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) {  returnedStatus, returnedError in
            if returnedStatus == .granted {
                completion(.success(true))
            } else {
                completion(.failure(CloudKitError.iCloudAccountPermissionNotGranted))
            }
        }
    }
    
    static private func fetchiCloudRecordId(completion: @escaping (Result<CKRecord.ID, Error>) -> ()) {
        CKContainer.default().fetchUserRecordID { returnedId, returnedError in
            if let id = returnedId {
                completion(.success(id))
            } else if let error = returnedError {
                completion(.failure(error))
            } else {
                completion(.failure(CloudKitError.iCloudCouldNotFetchUserId))
            }
        }
    }
    
    static private func discoverUserIdentity(id: CKRecord.ID, completion: @escaping icStringResult) {
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { returnedIdentity, returnedError in
            if let name = returnedIdentity?.nameComponents?.givenName {
                completion(.success(name))
            } else if let error = returnedError {
                completion(.failure(error))
            } else {
                completion(.failure(CloudKitError.iCloudCouldNotDiscoverUser))
            }
        }
    }
    
    static private func discoverUserIdentity(completion: @escaping icStringResult) {
        fetchiCloudRecordId { fetchCompletion in
            switch fetchCompletion {
            case .success(let recordID):
                discoverUserIdentity(id: recordID, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
