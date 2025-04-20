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
    @StateObject private var store = FlashcardStore(context: PersistenceController.shared.container.viewContext)
    @State private var showingAddView = false
    @State private var selectedCard: Flashcard?
    
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    }

    var body: some View {
        NavigationStack {
            Group {
                if store.flashcards.isEmpty {
                    emptyStateView
                } else {
                    flashcardGridView
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
        .sheet(isPresented: $showingAddView) {
            AddFlashcardView(store: store)
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
    
    private var flashcardGridView: some View {
        ScrollView {
            LazyVGrid(columns: gridColumns, spacing: 16) {
                ForEach(store.flashcards) { flashcard in
                    FlashcardCell(flashcard: flashcard) {
                        selectedCard = flashcard
                    } deleteAction: {
                        store.deleteFlashcard(flashcard)
                    }
                }
            }
            .padding()
        }
    }
}


#Preview {
            ContentView().environment(\.managedObjectContext, PersistenceController().container.viewContext)
}
