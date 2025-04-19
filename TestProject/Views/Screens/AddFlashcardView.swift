//
//  AddFlashcardView.swift
//  TestProject
//
//  Created by Artem on 19.04.25.
//

import SwiftUI

struct AddFlashcardView: View {
    @ObservedObject var store: FlashcardStore
    @Environment(\.dismiss) var dismiss
    
    @State private var word = ""
    @State private var image: UIImage?
    @State private var isSaving = false
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Слово", text: $word)
                    
                    Button("Выбрать изображение") {
                        showingImagePicker = true
                    }

                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    }
                }
            }
            .navigationBarTitle("Добавить карточку")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Отмена") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    if isSaving {
                        ProgressView()
                    } else {
                        Button("Сохранить") {
                            isSaving = true
                            if let image = image {
                                store.addFlashcard(word: word, image: image)
                            }
                            dismiss()
                        }
                        .disabled(word.isEmpty || image == nil)
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePickerView(image: $image)
            }
        }
    }
}
