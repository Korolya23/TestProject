//
//  TestProjectApp.swift
//  TestProject
//
//  Created by Artem on 12.04.25.
//

import SwiftUI

@main
struct TestProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
