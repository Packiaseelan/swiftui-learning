//
//  GenericsBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 11/07/22.
//

import SwiftUI

struct GenericModel<T> {
    let info: T?
    
    func removeData() -> GenericModel{
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    
    @Published var boolModel: GenericModel<Bool>
    @Published var stringModel: GenericModel<String>
    
    init() {
        boolModel = GenericModel(info: true)
        stringModel = GenericModel(info: "Hello, world!")
    }
    
    func removeData() {
        boolModel = boolModel.removeData()
        stringModel = stringModel.removeData()
    }
}

struct GenericsBootcamp: View {
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            Text(vm.boolModel.info?.description ?? "no data")
            Text(vm.stringModel.info ?? "no data")
            
            GenericView(
                title: "This is from generic View",
                content: Text("Generic view content")
            )
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}

struct GenericView<T:View>: View {
    let title: String
    let content: T
    var body: some View {
        Text(title)
        content
    }
}
