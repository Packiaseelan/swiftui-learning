//
//  AdvancedCombineBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 26/10/22.
//

import SwiftUI

struct AdvancedCombineBootcamp: View {
    
    @StateObject var vm = AdvancedCombineBootcampViewModel()
    
    var body: some View {
        ScrollView {
            HStack {
                VStack {
                    ForEach(vm.data, id: \.self) {
                        Text($0)
                            .font(.headline)
                            .fontWeight(.black)
                    }
                    
                    if !vm.error.isEmpty {
                        Text(vm.error)
                    }
                }
                
                VStack {
                    ForEach(vm.dataBools, id: \.self) {
                        Text($0.description)
                            .font(.headline)
                            .fontWeight(.black)
                    }
                }
            }
        }
    }
}

struct AdvancedCombineBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCombineBootcamp()
    }
}
