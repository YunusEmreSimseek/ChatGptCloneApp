//
//  HomeView.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel = .init(aiService: OpenAIService())) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages, id: \.self) { message in
                    if message.role == .user {
                        UserMessageCard(message: message.text)
                    } else if message.role == .assistant {
                        Text(message.text)
                    } else {
                        Text(message.text)
                            .foregroundStyle(.red)
                    }
                }

            }.padding()
            BottomChatInputBar(viewModel: viewModel)
        }

        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                TopBarLeadingItems(isMenuOpen: $viewModel.isMenuOpen)
            }
            ToolbarItem(placement: .topBarTrailing) { TopBarTrailingItems() }
        }
        .overlay {
            if viewModel.isMenuOpen {
                SideMenu(isMenuOpen: $viewModel.isMenuOpen)
            }
        }
    }
}

private struct BottomChatInputBar: View {
    @State var viewModel: HomeViewModel
    var body: some View {
        HStack(spacing: .low3) {
            Button(action: {}) {
                Image(systemName: "plus")
                    .foregroundStyle(.foreground)
                    .font(.title2)
                    .padding(.normal)
                    .background(.thinMaterial)
                    .clipShape(.circle)

                HStack {
                    TextField(LocaleKeys.Home.inputPlaceholder, text: $viewModel.textInputValue)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Spacer()

                    if viewModel.textInputValue.isEmpty {
                        Image(systemName: "mic")
                            .foregroundStyle(.foreground)
                            .font(.title3)
                        Image(systemName: "waveform.circle.fill")
                            .foregroundStyle(.foreground)
                            .font(.largeTitle)
                    } else {
                        Button {
                            Task { await viewModel.sendMessage() }
                        } label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .foregroundStyle(.foreground)
                                .font(.largeTitle)
                        }
                    }
                }
                .padding(.low3)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: .low))
            }
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}

private struct TopBarTrailingItems: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "square.and.pencil")
                    .foregroundStyle(.foreground)
            }
            Menu {
                Button {} label: {
                    Label(LocaleKeys.Home.Menu.share, systemImage: "square.and.arrow.up")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.Menu.rename, systemImage: "pencil")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.Menu.report, systemImage: "flag")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.Menu.archive, systemImage: "archivebox")
                }
                Button(role: .destructive) {} label: {
                    Label(LocaleKeys.Button.delete, systemImage: "trash")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(.foreground)
            }
        }
    }
}

private struct TopBarLeadingItems: View {
    @Binding var isMenuOpen: Bool
    var body: some View {
        HStack {
            Button(action: { withAnimation { isMenuOpen.toggle() }}) {
                Image(systemName: "line.3.horizontal")
                    .foregroundStyle(.foreground)
            }
            HStack(spacing: .veryLow2) {
                Text("ChatGPT").font(.title3)
                HStack(spacing: .veryLow2) {
                    Text("5").font(.title3)
                    Image(systemName: "chevron.forward").font(.caption2)
                }.foregroundStyle(.secondary)
            }
        }
    }
}

private struct SideMenu: View {
    @Binding var isMenuOpen: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Menü").font(.title2.bold())
                Spacer()
                Button(action: { isMenuOpen.toggle() }) {
                    Image(systemName: "xmark").font(.system(size: 16, weight: .semibold))
                }
            }
            .padding(.bottom, 8)
        }
    }
}

private struct UserMessageCard: View {
    let message: String
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: .low))
                .frame(maxWidth: .dynamicWidth(width: 0.7), alignment: .trailing)
        }
    }
}
