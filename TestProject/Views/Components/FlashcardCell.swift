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
