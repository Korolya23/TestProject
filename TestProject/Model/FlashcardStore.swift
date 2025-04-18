//
//  FlashcardStore.swift
//  TestProject
//
//  Created by Artem on 18.04.25.
//

import SwiftUI
import CoreData

class FlashcardStore: ObservableObject {
    @Published var flashcards: [Flashcard] = []
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchFlashcards()
    }
    
    func fetchFlashcards() {
        let request: NSFetchRequest<Flashcard> = Flashcard.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Flashcard.createAt, ascending: true)]
        
        do {
            flashcards = try context.fetch(request)
        } catch {
            print("Fetching flashcards failed: \(error)")
        }
    }
    
    func addFlashcard(word: String, image: UIImage) {
        let newCard = Flashcard(context: context)
        newCard.id = UUID()
        newCard.word = word
        newCard.imageData = image.pngData()
        newCard.createAt = Date()
        
        fetchFlashcards()
        saveContext()
    }
    
    private func saveContext() {
        PersistenceController.shared.saveContext()
    }
    
}
