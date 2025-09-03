//
//  TopBarLeadingItems.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import SwiftUI

struct TopBarLeadingItems: View {
    @Binding var isSideMenuOpen: Bool
    @Binding var selectedChat: ChatModel
    let isPremiumUser: Bool
    @State private var isOpenAIModelsMenu: Bool = false
    @State private var isLegacyModelsExpanded: Bool = false
    var body: some View {
        if !isSideMenuOpen {
            HStack {
                Button(action: { withAnimation { isSideMenuOpen.toggle() }}) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.foreground)
                        .fontWeight(.medium)
                }
                if isPremiumUser {
                    Menu {
                        Text("\(LocaleKeys.Home.AIModelMenu.aiDisplayFormat)\(selectedChat.aiModel.displayValue)")
                        ForEach(AIModel.allCases, id: \.self) { model in
                            if model != .gpt4_o {
                                Button {
                                    selectedChat.aiModel = model
                                } label: {
                                    Text(model.menuTitle)
                                    Text(model.menuDescription)
                                }
                            }
                        }
                        Menu(LocaleKeys.Home.AIModelMenu.legacyModelsTitle) {
                            Button("\(LocaleKeys.Home.AIModelMenu.aiDisplayFormat)\(AIModel.gpt4_o.displayValue)") {
                                selectedChat.aiModel = .gpt4_o
                            }
                        }

                    } label: {
                        HStack(spacing: .veryLow2) {
                            Text(LocaleKeys.App.name).font(.title3)

                            HStack(spacing: .veryLow2) {
                                Text(selectedChat.aiModel.displayValue).font(.title3)
                                Image(systemName: "chevron.forward").font(.caption2)
                            }.foregroundStyle(.secondary)
                        }
                    }.foregroundStyle(.foreground)
                } else {
                    if !selectedChat.messages.isEmpty {
                        Text(LocaleKeys.App.name).fontWeight(.medium)
                    }
                }
            }
        }
    }
}
