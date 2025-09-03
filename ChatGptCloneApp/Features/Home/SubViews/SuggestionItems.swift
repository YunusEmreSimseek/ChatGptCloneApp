//
//  SuggestionItems.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 2.09.2025.
//

import SwiftUI

struct SuggestionItems: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                SuggestionCard(title: "Create an illustration", text: "for a bakery")
                SuggestionCard(title: "Count the number of items", text: "in an image")
                SuggestionCard(title: "Summarize a long document", text: "that I'm going to send you")
            }
        }
        .scrollIndicators(.hidden)
    }
}

private struct SuggestionCard: View {
    let title: String
    let text: String
    var body: some View {
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
}
