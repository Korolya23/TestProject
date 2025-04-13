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
            .padding()
            .font(.system(.title))
        }
    }


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
