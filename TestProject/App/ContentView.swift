//
//  ContentView.swift
//  TestProject
//
//  Created by Artem on 12.04.25.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @StateObject private var store = Flashcard(context: PersistenceController.shared.container.viewContext)
    @State private var showingAddView = false
    @State private var selectedFlashcard: Flashcard?
    
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }

    var body: some View {
        NavigationStack {
            Group {
                emptyStateView
            }
        }
        .navigationTitle("Флеш-карточки")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

private var emptyStateView: some View {
    VStack {
        Image(systemName: "photo.on.rectangle.angled")
            .font(.system(size: 50))
        
        Text("Добавьте первую карточку")
            .font(.title2)
    }
    .foregroundColor(.gray)
}


#Preview {
            ContentView().environment(\.managedObjectContext, PersistenceController().container.viewContext)
}
