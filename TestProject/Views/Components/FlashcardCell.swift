//
//  FlashcardCell.swift
//  TestProject
//
//  Created by Artem on 19.04.25.
//

import SwiftUI

struct FlashcardCell: View {
    let flashcard: Flashcard
    var action: () -> Void
    var deleteAction: () -> Void
    
    @State private var displayedImage: UIImage?
    private let imageLoader = ImageLoader()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if let image = flashcard.getImage() {
                Image(uiImage: displayedImage ?? UIImage(systemName: "photo")!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .clipped()
            } else {
                placeholderView
                    .overlay(ShimmerEffectView())
            }
            
            Text(flashcard.wrappedWord)
                .font(.headline)
                .foregroundColor(.white)
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
        }
        .frame(width: 110, height: 150)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            action()
        }
        .contextMenu {
            Button(role: .destructive) {
                deleteAction()
            } label: {
                Label("Удалить", systemImage: "trash")
            }
        }
    }
    
    private var placeholderView: some View {
        ZStack {
            Color.gray.opacity(0.2)
                .frame(width: 110, height: 150)
                .cornerRadius(10)
            
            Image(systemName: "photo.fill")
                .font(.system(size: 30))
                .foregroundColor(.gray)
        }
    }
}
