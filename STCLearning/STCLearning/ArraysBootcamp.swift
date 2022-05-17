//
//  ArraysBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 17/05/22.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    enum SortOptions: String, CaseIterable {
        case nameAsc
        case nameDsc
        case pointsAsc
        case pointsDsc
    }
    
    @Published var dataArray: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var isVerified: Bool = false
    @Published var sort: SortOptions = SortOptions.nameAsc {
        didSet {
            sortBy()
        }
    }
    
    
    init() {
        getUsers()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Iron Man", points: 30, isVerified: true)
        let user2 = UserModel(name: "Captain America", points: 100, isVerified: false)
        let user3 = UserModel(name: "Spider Man", points: 5, isVerified: true)
        let user4 = UserModel(name: "Ant man", points: 9, isVerified: false)
        let user5 = UserModel(name: "Hulk", points: 56, isVerified: true)
        let user6 = UserModel(name: "Black Widow", points: 10, isVerified: false)
        let user7 = UserModel(name: "Winter Solder", points: 0, isVerified: true)
        let user8 = UserModel(name: "Dr Strange", points: 45, isVerified: true)
        let user9 = UserModel(name: "Captain Marvel", points: 6, isVerified: false)
        let user10 = UserModel(name: "Black Panther", points: 34, isVerified: true)
        
        dataArray.append(contentsOf: [
            user1,user2,user3,user4,user5,user6,user7,user8,user9,user10,
        ])
        
        filteredArray = dataArray
    }
    
    func searchName(name: String) {
        
        if name.count == 0 {
            filteredArray = dataArray
            return
        }
        
        filteredArray = dataArray.filter({ $0.name.lowercased().contains(name.lowercased())})
    }
    
    func sortBy() {
        var data = dataArray
        if isVerified {
            data = filteredArray
        }
        switch sort {
        case .nameAsc:
            filteredArray = data.sorted(by: {$0.name.localizedCaseInsensitiveCompare($1.name) == .orderedAscending})
            break
            
        case .nameDsc:
            filteredArray = data.sorted(by: {$0.name.localizedCaseInsensitiveCompare($1.name) == .orderedDescending})
            break
            
        case .pointsAsc:
            filteredArray = data.sorted(by: {$0.points < $1.points})
            break
            
        case .pointsDsc:
            filteredArray = data.sorted(by: {$0.points > $1.points})
            break
        }
    }
    
    func toggleIsVerified() {
        isVerified.toggle()
        
        if isVerified {
            filteredArray = dataArray.filter({ $0.isVerified})
        } else {
            filteredArray = dataArray
        }
        
        sortBy()
    }
}

struct ArraysBootcamp: View {
    
    @State var searchText = ""
    
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(vm.filteredArray) {user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            HStack {
                                Text("Points: \(user.points)")
                                Spacer()
                                if user.isVerified {
                                    Image(systemName: "flame.fill")
                                }
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue.cornerRadius(10))
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct ArraysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ArraysBootcamp()
    }
}


extension ArraysBootcamp {
    private var header: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("search by name", text: $searchText)
                    .onChange(of: searchText, perform: { newValue in
                        
                        withAnimation(.spring()){
                            vm.searchName(name: newValue)
                        }
                        
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text(vm.isVerified ? "Verified" : "All")
                    .foregroundColor(.blue)
                    .frame(width: 80)
                    .onTapGesture {
                        vm.toggleIsVerified()
                    }
            }
            
            HStack {
                Text("Sort By:")
                
                Picker(selection: $vm.sort) {
                    ForEach(ArrayModificationViewModel.SortOptions.allCases, id: \.self) { sort in
                        Text(sort.rawValue)
                    }
                } label: {
                    Text("Sort By")
                }
                .pickerStyle(SegmentedPickerStyle())

            }
            .padding(.vertical)
            
            Text("User: \(vm.filteredArray.count)")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding()
    }
}
