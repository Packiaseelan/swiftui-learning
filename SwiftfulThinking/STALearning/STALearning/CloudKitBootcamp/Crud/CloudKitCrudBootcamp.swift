//
//  CloudKitCrudBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 23/11/22.
//

import SwiftUI

struct CloudKitCrudBootcamp: View {
    
    @StateObject var vm = CloudKitCrudBootcampViewModel()
    
    var body: some View {
        VStack {
            header
            textField
            addButton
            
            List {
                ForEach(vm.fruits, id: \.self) { fruit in
                    HStack {
                        Text(fruit.name)
                        
                        if let url = fruit.imageUrl, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                            
                    }
                    .onTapGesture {
                        vm.updateItem(fruit: fruit)
                    }
                }
                .onDelete(perform: vm.deleteItem)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
        
    }
}

struct CloudKitCrudBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitCrudBootcamp()
    }
}

extension CloudKitCrudBootcamp {
    private var header: some View {
        Text("CloudKit CRUD ☁️")
            .font(.headline)
            .underline()
    }
    
    private var textField: some View {
        TextField("Add something here...", text: $vm.text)
            .frame(height: 55)
            .padding(.leading)
            .background(Color.gray.opacity(0.4))
            .cornerRadius(10)
    }
    
    private var addButton: some View {
        Button {
            vm.addButtonPressed()
        } label: {
            Text("Add")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
        }

    }
}
