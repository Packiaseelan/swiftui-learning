//
//  FuturesBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 10/11/22.
//

import SwiftUI

struct FuturesBootcamp: View {
    
    @StateObject private var vm = FuturesBootcampViewModel()
    
    var body: some View {
        Text(vm.title)
    }
}

struct FuturesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FuturesBootcamp()
    }
}
