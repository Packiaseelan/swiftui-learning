//
//  CloudKitUtility.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/11/22.
//

import Foundation
import CloudKit
import Combine
import SwiftUI

typealias icBoolResult = (Result<Bool, Error>) -> ()
typealias icStringResult = (Result<String, Error>) -> ()
typealias icBoolFuture = Future<Bool, Error>
typealias icStringFuture = Future<String, Error>

protocol CloudKitableProtocol {
    init?(record: CKRecord)
    var record: CKRecord { get }
}

class CloudKitUtility {
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
        case iCloudAccountPermissionNotGranted
        case iCloudCouldNotFetchUserId
        case iCloudCouldNotDiscoverUser
        case iCloudNotificationPermissionFailure
    }
}
