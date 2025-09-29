//
//  SuggestionItems.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 2.09.2025.
//

import SwiftUI

extension HomeView {
    var suggestionItems: some View {
        ScrollView(.horizontal) {
            HStack {
                suggestionCard("Create an illustration", "for a bakery")
                suggestionCard("Count the number of items", "in an image")
                suggestionCard("Summarize a long document", "that I'm going to send you")
            }
        }
        .scrollIndicators(.hidden)
    }
}

private func suggestionCard(_ title: String, _ text: String) -> some View {
    VStack(alignment: .leading) {
        Text(title)
            .fontWeight(.heavy)
        Text(text)
            .foregroundStyle(.secondary)
            .font(.callout)
    }
    .padding()
    .rectThinCard()
}
