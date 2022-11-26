//
//  CrudFunctions.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/11/22.
//

import Foundation
import Combine
import CloudKit

// MARK: CRUD Functions
extension CloudKitUtility {
    static func fetch<T: CloudKitableProtocol>(
        predicate: NSPredicate,
        recordType: CKRecord.RecordType,
        sortDescriptors: [NSSortDescriptor]? = nil,
        resultsLimit: Int? = nil
    ) -> Future<[T], Error> {
        Future { promise in
            fetch(predicate: predicate, recordType: recordType, sortDescriptors: sortDescriptors, resultsLimit: resultsLimit) { items in
                promise(.success(items))
            }
        }
    }
    
    static func add<T: CloudKitableProtocol>(item: T, completion: @escaping icBoolResult) {
        let record = item.record
        save(record: record, completion: completion)
    }
    
    static func update<T: CloudKitableProtocol>(item: T, completion: @escaping icBoolResult) {
        add(item: item, completion: completion)
    }
    
    static func delete<T: CloudKitableProtocol>(item: T) -> icBoolFuture {
        Future {
            delete(item: item, completion: $0)
        }
    }
    
    static private func fetch<T: CloudKitableProtocol>(
        predicate: NSPredicate,
        recordType: CKRecord.RecordType,
        sortDescriptors: [NSSortDescriptor]?,
        resultsLimit: Int?,
        completion: @escaping (_ items: [T]) -> ()
    ) {
        let operation = createOperations(predicate: predicate, recordType: recordType, sortDescriptors: sortDescriptors, resultsLimit: resultsLimit)
        
        var returnedItems: [T] = []
        
        recordMatchedBlock(operation: operation) { item in
            returnedItems.append(item)
        }
        
        queryResultBlock(operation: operation) { finished in
            completion(returnedItems)
        }
        
        add(operation: operation)
    }
    
    static private func createOperations(
        predicate: NSPredicate,
        recordType: CKRecord.RecordType,
        sortDescriptors: [NSSortDescriptor]?,
        resultsLimit: Int?
    ) -> CKQueryOperation {
        let query = CKQuery(recordType: recordType, predicate: predicate)
        query.sortDescriptors = sortDescriptors
        let queryOperation = CKQueryOperation(query: query)
        if let limit = resultsLimit {
            queryOperation.resultsLimit = limit
        }
        return queryOperation
    }
    
    static private func recordMatchedBlock<T: CloudKitableProtocol>(
        operation: CKQueryOperation,
        completion: @escaping (_ item: T) -> ()
    ) {
        if #available(iOS 15.0, *) {
            operation.recordMatchedBlock = { returnedRecordId, returnedResult in
                switch returnedResult {
                case .success(let record):
                    guard let item = T(record: record) else { return }
                    completion(item)
                case .failure:
                    break
                }
            }
        } else {
            operation.recordFetchedBlock = { returnedRecord in
                guard let item = T(record: returnedRecord) else { return }
                completion(item)
            }
        }
    }
    
    static private func queryResultBlock(
        operation: CKQueryOperation,
        completion: @escaping (_ finished: Bool) -> ()
    ) {
        if #available(iOS 15.0, *) {
            operation.queryResultBlock = {  _ in
                completion(true)
            }
        } else {
            operation.queryCompletionBlock = { _, _ in
                completion(true)
            }
        }
    }
    
    static private func add(operation: CKDatabaseOperation) {
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    static private func save(record: CKRecord, completion: @escaping icBoolResult) {
        CKContainer.default().publicCloudDatabase.save(record) { returnedRecord, returnedError in
            if let error = returnedError {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    static private func delete(record: CKRecord, completion: @escaping icBoolResult) {
        CKContainer.default().publicCloudDatabase.delete(withRecordID: record.recordID) { returnedRecordId, returnedError in
            if let error = returnedError {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }
    
    static private func delete<T: CloudKitableProtocol>(item: T, completion: @escaping icBoolResult) {
        delete(record: item.record, completion: completion)
    }
}
