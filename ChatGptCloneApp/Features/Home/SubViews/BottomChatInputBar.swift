//
//  BottomChatInputBar.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import SwiftUI

extension HomeView {
    struct BottomChatInputBar: View {
        @Binding var textInputValue: String
        let onSendMessage: () async -> Void
        var body: some View {
            HStack(spacing: .low3) {
                Button(action: {}) {
                    Image(systemName: "plus")
                        .foregroundStyle(.foreground)
                        .font(.title3)
                        .padding(.low)
                        .circleCard()

                    HStack {
                        TextField(LocaleKeys.Home.inputPlaceholder, text: $textInputValue)
                            .submitLabel(.done)
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                            .padding(.vertical, .low)
                        Spacer()

                        if textInputValue.isEmpty {
                            Image(systemName: "mic")
                                .foregroundStyle(Color.secondary)
                                .font(.title3)
                                .fontWeight(.medium)

                            Image(systemName: "waveform.circle.fill")
                                .foregroundStyle(.foreground)
                                .font(.largeTitle)
                                .fontWeight(.medium)
                        } else {
                            Button {
                                Task { await onSendMessage() }
                            } label: {
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundStyle(.foreground)
                                    .font(.largeTitle)
                            }
                        }
                    }
                    .padding(.horizontal, .low3)
                    .rectThinCard()
                }
            }.padding(.horizontal, .low3)
        }
    }
}
