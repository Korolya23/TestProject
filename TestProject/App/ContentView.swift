//
//  ContentView.swift
//  TestProject
//
//  Created by Artem on 12.04.25.
//


import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
            ContentView().environment(\.managedObjectContext, PersistenceController().container.viewContext)
}
