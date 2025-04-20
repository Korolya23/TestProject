//
//  ShimmerEffectView.swift
//  TestProject
//
//  Created by Artem on 20.04.25.
//

import SwiftUI

struct ShimmerEffectView: View {
    @State private var isAnimating = false
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.gray.opacity(0.3),
                Color.gray.opacity(0.7),
                Color.gray.opacity(0.3)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(RoundedRectangle(cornerRadius: 10))
        .offset(x: isAnimating ? 200 : -200)
        .animation(
            Animation.linear(duration: 1.5).repeatForever(autoreverses: false),
            value: isAnimating
        )
        .onAppear {
            isAnimating = true
        }
    }
}
