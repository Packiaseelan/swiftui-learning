//
//  CloudKitListView.swift
//  STALearning
//
//  Created by Packiaseelan S on 24/11/22.
//

import SwiftUI

struct CloudKitListView: View {
    var body: some View {
        List {
            Section(header: Text("CloudKit")) {
                NavigationLink("CloudKit User") {
                    CloudKitUserBootcamp()
                }
                NavigationLink("CloudKit Crud") {
                    CloudKitCrudBootcamp()
                }
                NavigationLink("CloudKit PushNotification") {
                    CloudKitPushNotificationBootcamp()
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct CloudKitListView_Previews: PreviewProvider {
    static var previews: some View {
        CloudKitListView()
    }
}
