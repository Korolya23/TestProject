//
//  FlashcardDetailView.swift
//  TestProject
//
//  Created by Artem on 20.04.25.
//

import SwiftUI

struct FlashcardDetailView: View {
    let card: Flashcard
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = card.getImage() {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 300)
                    .cornerRadius(10)
            } else {
                ShimmerEffectView()
                    .frame(width: 300, height: 300)
            }
            
            Text(card.wrappedWord)
                .font(.title.bold())
                .padding()
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
