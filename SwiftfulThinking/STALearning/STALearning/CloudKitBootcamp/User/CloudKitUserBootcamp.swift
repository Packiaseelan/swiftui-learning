//
//  CloudKitUserBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 22/11/22.
//

import SwiftUI


struct CloudKitUserBootcamp: View {
    
    @StateObject var vm = CloudKitUserBootcampViewModel()
    
    var body: some View {
        VStack {
            Text("Is Signed IN: \(vm.isSignedInToiCloud.description.uppercased())")
            Text(vm.error)
            Text("Permission: \(vm.permissionStatus.description.uppercased())")
            Text("Name: \(vm.userName)")
        }
    }
}

struct CloudKitUserBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitUserBootcamp()
    }
}
