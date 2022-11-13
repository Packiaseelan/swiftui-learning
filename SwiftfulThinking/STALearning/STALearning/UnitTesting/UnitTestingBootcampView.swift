//
//  UnitTestingBootcampView.swift
//  STALearning
//
//  Created by Packiaseelan S on 15/09/22.
//

import SwiftUI

struct UnitTestingBootcampView: View {
    
    @StateObject var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
