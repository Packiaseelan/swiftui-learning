//
//  EscapingBootcamp.swift
//  STCLearning
//
//  Created by Packiaseelan S on 01/06/22.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "Hello!"
    
    func getData() {
//        let newData = downloadData()
//        text = newData
        
//        downloadData2 { data in
//            text = data
//        }
        
//        downloadData3 { [weak self] data in
//            self?.text = data
//        }
        
//        downloadData4 { [weak self] result in
//            self?.text = result.data
//        }
        
        downloadData5 { [weak self] result in
            self?.text = result.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New data!")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completionHandler("New data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let result = DownloadResult(data: "New data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingBootcamp: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.blue)
            .onTapGesture {
                vm.getData()
            }
    }
}

struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
