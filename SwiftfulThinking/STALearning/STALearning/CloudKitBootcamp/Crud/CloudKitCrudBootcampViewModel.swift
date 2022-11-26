//
//  CloudKitCrudBootcampViewModel.swift
//  STALearning
//
//  Created by Packiaseelan S on 23/11/22.
//

import Foundation
import CloudKit
import SwiftUI
import Combine

struct FruitModel: Hashable, CloudKitableProtocol {
    let name: String
    let imageUrl: URL?
    let record: CKRecord
    
    init?(record: CKRecord) {
        guard let name = record["name"] as? String else { return nil }
        self.name = name
        let imageAsset = record["image"] as? CKAsset
        self.imageUrl = imageAsset?.fileURL
        self.record = record
    }
    
    init? (name: String, imageUrl: URL?) {
        let record = CKRecord(recordType: "Fruits")
        record["name"] = name
        if let url = imageUrl {
            record["image"] = CKAsset(fileURL: url)
        }
        self.init(record: record)
    }
    
    func update(newName: String) -> FruitModel? {
        let record = record
        record["name"] = newName
        return FruitModel(record: record)
    }
}

class CloudKitCrudBootcampViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var fruits: [FruitModel] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchItems()
    }
    
    func addButtonPressed() {
        guard !text.isEmpty else { return }
        addItem(name: text)
    }
    
    private func addItem(name: String) {
        guard
            let image = UIImage(named: "themountain"),
            let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("themountain.png"),
            let data = image.pngData() else { return }
        
        do {
            try data.write(to: url)
            guard let newFruit = FruitModel(name: name, imageUrl: url) else {return }
            CloudKitUtility.add(item: newFruit) { [weak self] result in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self?.text = ""
                    self?.fetchItems()
                }
            }
        } catch(let error) {
            print("Error: \(error)")
        }
    }
    
    func fetchItems() {
        let predicate = NSPredicate(value: true)
        let recordType = "Fruits"
        
        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.fruits = returnedItems
            }
            .store(in: &cancellables)
    }
    
    func updateItem(fruit: FruitModel) {
        let name = fruit.record["name"] as? String
        guard let newFriut = fruit.update(newName: "\(name ?? "new name") 1") else { return }
        CloudKitUtility.update(item: newFriut) { [weak self] result in
            self?.fetchItems()
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let fruit = fruits[index]
        
        CloudKitUtility.delete(item: fruit)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
            } receiveValue: { [weak self] sucess in
                if sucess {
                    DispatchQueue.main.async {
                        self?.fruits.remove(at: index)
                    }
                }
            }
            .store(in: &cancellables)
    }
}
