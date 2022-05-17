//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Packiaseelan S on 17/05/22.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
