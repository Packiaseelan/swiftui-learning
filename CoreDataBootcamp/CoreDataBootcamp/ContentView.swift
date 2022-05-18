//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by Packiaseelan S on 17/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: FruitEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \FruitEntity.name, ascending: false )])
    var fruits: FetchedResults<FruitEntity>
    
    @State var fruitNameField = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Fruit name here...", text: $fruitNameField)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Add") {
                        addItem()
                    }
                    .padding(.horizontal)
                    
                }
                .padding()
                List {
                    ForEach(fruits) { item in
                        Text(item.name ?? "")
                            .onTapGesture {
                                updateIten(fruit: item)
                            }
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }

    private func addItem() {
        if fruitNameField.isEmpty {
            return
        }
        withAnimation {
            let fruit = FruitEntity(context: viewContext)
            fruit.name = fruitNameField

            saveData()
            
            fruitNameField = ""
        }
    }
    
    private func updateIten(fruit: FruitEntity) {
        let currentName = fruit.name ?? ""
        let newName = currentName + "!"
        fruit.name = newName
        
        saveData()
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            guard let index = offsets.first else { return }
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)

            saveData()
        }
    }
    
    private func saveData() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
