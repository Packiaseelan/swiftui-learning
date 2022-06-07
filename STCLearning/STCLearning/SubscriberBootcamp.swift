//
//  SubscriberBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 06/06/22.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    
    @Published var count: Int = 0
    @Published var textFieldText: String = ""
    @Published var isValidText: Bool = false
    @Published var enableButton: Bool = false
    
//    var timer: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init() {
        setUpTimer()
        addTextFieldSubscribers()
        addButtonSubscribers()
    }
    
    func addTextFieldSubscribers() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text in
            if text.count > 3 {
                return true
            }
            return false
        }
//        .assign(to: \.isValidText, on: self)
        .sink(receiveValue: { [weak self] isValid in
            self?.isValidText = isValid
        })
        .store(in: &cancellables)
    }
    
    func setUpTimer() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                self.count += 1
                
//                if self.count >= 10 {
////                    self.timer?.cancel()
//                    for cancellable in self.cancellables {
//                        cancellable.cancel()
//                    }
//                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscribers() {
        $isValidText
            .combineLatest($count)
            .sink { [weak self] (isvalid, count) in
                guard let self = self else { return }
                if isvalid && count > 10 {
                    self.enableButton = true
                } else {
                    self.enableButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct SubscriberBootcamp: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.isValidText.description)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame( height: 55)
                .font(.title)
                .textFieldStyle(DefaultTextFieldStyle())
                .padding()
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(
                                vm.textFieldText.count < 1 ? 0 :
                                vm.isValidText ? 0 : 1)
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(vm.isValidText ? 1 : 0)
                    }
                        .padding(.trailing)
                        .font(.largeTitle)
                    ,alignment: .trailing
                )
            
            Button (
                action:{} ,
                label: {
                    Text("Submit")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame( height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .opacity(vm.enableButton ? 1 : 0.5)
                })
            .disabled(!vm.enableButton)

        }
    }
}

struct SubscriberBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SubscriberBootcamp()
    }
}
