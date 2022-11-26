//
//  CloudKitPushNotificationBootcamp.swift
//  STALearning
//
//  Created by Packiaseelan S on 25/11/22.
//

import SwiftUI

struct CloudKitPushNotificationBootcamp: View {
    
    @StateObject var vm = CloudKitPushNotificationBootcampViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Request notification Permissions") {
                vm.requestNotificationPermissions()
            }
            
            Button("Subscribe to notifications") {
                vm.subscribeToNotifications()
            }
            
            Button("Unsubscribe to notifications") {
                vm.unSubscribeToNotifications()
            }
        }
    }
}

struct CloudKitPushNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitPushNotificationBootcamp()
    }
}
