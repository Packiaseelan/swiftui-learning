//
//  WeekSelfBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 30/05/22.
//

import SwiftUI

struct WeekSelfBootcamp: View {
    @AppStorage("count") var count: Int?
    var body: some View {
        VStack {
            if let count = count {
                Text("\(count)")
            }
            NavigationLink("GOTO Second") {
                WeekSelfSecondScreen()
            }
            .navigationTitle("Week Self")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

class WeekSelfSecondScreenViewModel: ObservableObject {
    
    @Published var data: String = ""
    
    init() {
        print("INITIALIZE")
        fetchData()
    }
    
    deinit {
        print("DEINITIALIZE")
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 500) { [weak self] in
            self?.data = "NEW DATA"
        }
    }
}

struct WeekSelfSecondScreen: View {
    @StateObject var vm = WeekSelfSecondScreenViewModel();
    var body: some View {
        VStack {
            Text(vm.data)
            Text("Second Screen")
        }
    }
}

struct WeekSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeekSelfBootcamp()
    }
}
