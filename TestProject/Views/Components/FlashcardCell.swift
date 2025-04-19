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
            Image(uiImage: displayedImage ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .clipped()
        }
    }
        
}
