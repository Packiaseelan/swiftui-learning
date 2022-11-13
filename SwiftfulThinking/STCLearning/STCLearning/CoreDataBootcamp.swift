//
//  CoreDataBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 18/05/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA: \(error)")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let fruits = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            savedEntities = try container.viewContext.fetch(fruits)
        } catch let error {
            print("ERROR FETCHING FRUITS: \(error)")
        }
        
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func deleteFruit(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let fruitEntity = savedEntities[index]
        container.viewContext.delete(fruitEntity)
        saveData()
    }
    
    func updateFruit(fruit: FruitEntity) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        fruit.name = newName
        
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch let error {
            print("ERROR SAVING: \(error)")
        }
        
    }
}

struct CoreDataBootcamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Fruit name here...", text: $textFieldText)
                        .frame(height: 55)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") {
                        guard !textFieldText.isEmpty else {return}
                        vm.addFruit(text: textFieldText)
                        textFieldText = ""
                    }
                    .padding(.horizontal)
                    
                }
                .padding()
                
                List {
                    ForEach(vm.savedEntities ) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                vm.updateFruit(fruit: item)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
