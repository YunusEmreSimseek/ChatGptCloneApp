//
//  ViewExtension.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 2.09.2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, _ transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    func card(bgColor: Color = .clear, bgMaterial: Material = .thinMaterial, shape: some Shape = .rect(cornerRadius: .low)) -> some View {
        return background(bgColor).background(bgMaterial).clipShape(shape)
    }

    func rectThinCard(bgColor: Color = .clear, cornerRadius: CGFloat = .low) -> some View {
        return background(bgColor).background(.thinMaterial).clipShape(.rect(cornerRadius: cornerRadius))
    }

    func circleCard(bgColor: Color = .clear) -> some View {
        return background(bgColor).background(.thinMaterial).clipShape(.circle)
    }
}
