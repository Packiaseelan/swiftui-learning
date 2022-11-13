//
//  DependencyInjectionBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/08/22.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
    
    func getData() -> AnyPublisher<[PostModel], Error>
}

class MockDataService: DataServiceProtocol {
    let testData = [
        PostModel(userId: 1, id: 1, title: "One", body: "One"),
        PostModel(userId: 1, id: 2, title: "Two", body: "Two"),
    ]
    func getData() -> AnyPublisher<[PostModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
}

class ProductionDataService: DataServiceProtocol {
    //https://jsonplaceholder.typicode.com/posts
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostModel] = []
    let dataService: DataServiceProtocol
    var cancellables = Set<AnyCancellable>()
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in
            } receiveValue: { [weak self] receivedData in
                self?.dataArray = receivedData
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootcamp: View {
    
    @StateObject private var vm: DependencyInjectionViewModel
    
    init(dataService: DataServiceProtocol) {
        self._vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
    
//    static let dataService: DataServiceProtocol = ProductionDataService(url:  URL(string: "https://jsonplaceholder.typicode.com/posts")!)
    
    static let dataService: DataServiceProtocol = MockDataService()
    
    static var previews: some View {
        DependencyInjectionBootcamp(dataService: dataService)
    }
}
