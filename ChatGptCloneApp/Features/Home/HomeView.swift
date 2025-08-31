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
        ZStack(alignment: .leading) {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: .normal) {
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
                    }
                }
                .padding()

                BottomChatInputBar(viewModel: viewModel)
            }
            if viewModel.isMenuOpen {
                Color.secondary
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            viewModel.isMenuOpen.toggle()
                        }
                    }
            }
            SideMenu(isMenuOpen: $viewModel.isMenuOpen)
        }
        .modifier(CenterLoadingViewModifier(isLoading: viewModel.isLoading))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                TopBarLeadingItems(isMenuOpen: $viewModel.isMenuOpen, selectedAIModel: $viewModel.selectedAIModel)
            }
            ToolbarItem(placement: .topBarTrailing) { TopBarTrailingItems() }
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
                        .submitLabel(.done)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .padding(.vertical)
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
                .padding(.horizontal, .low3)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: .low))
            }
        }.padding(.horizontal, .low3)
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
                    Label(LocaleKeys.Home.TrailingMenu.share, systemImage: "square.and.arrow.up")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.TrailingMenu.rename, systemImage: "pencil")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.TrailingMenu.report, systemImage: "flag")
                }
                Button {} label: {
                    Label(LocaleKeys.Home.TrailingMenu.archive, systemImage: "archivebox")
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
    @Binding var selectedAIModel: AIModel
    @State private var isOpenAIModelsMenu: Bool = false
    @State private var isLegacyModelsExpanded: Bool = false
    var body: some View {
        if !isMenuOpen {
            HStack {
                Button(action: { withAnimation { isMenuOpen.toggle() }}) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.foreground)
                }
                Menu {
                    Text("\(LocaleKeys.Home.AIModelMenu.aiDisplayFormat)\(selectedAIModel.displayValue)")
                    ForEach(AIModel.allCases, id: \.self) { model in
                        if model != .gpt4_o {
                            Button {
                                selectedAIModel = model
                            } label: {
                                Text(model.menuTitle)
                                Text(model.menuDescription)
                            }
                        }
                    }
                    Menu(LocaleKeys.Home.AIModelMenu.legacyModelsTitle) {
                        Button("\(LocaleKeys.Home.AIModelMenu.aiDisplayFormat)\(AIModel.gpt4_o.displayValue)") {
                            selectedAIModel = .gpt4_o
                        }
                    }

                } label: {
                    HStack(spacing: .veryLow2) {
                        Text(LocaleKeys.App.name).font(.title3)

                        HStack(spacing: .veryLow2) {
                            Text(selectedAIModel.displayValue).font(.title3)
                            Image(systemName: "chevron.forward").font(.caption2)
                        }.foregroundStyle(.secondary)
                    }
                }.foregroundStyle(.foreground)
            }
        }
    }
}

private struct SideMenu: View {
    @Binding var isMenuOpen: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: .dynamicHeight(height: 0.02)) {
                HStack(alignment: .center) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)
                            .font(.title3)
                        TextField(LocaleKeys.Home.SideMenu.search, text: .constant(""))
                            .padding(.vertical, .low)
                    }
                    .padding(.horizontal, .low3)
                    .background(.thinMaterial)
                    .clipShape(.rect(cornerRadius: .low))

                    Spacer()

                    Button {} label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundStyle(.foreground)
                            .font(.title)
                            .padding(.bottom, .veryLow)
                    }
                }
                HStack(spacing: .normal) {
                    Image(systemName: "aqi.high")
                        .font(.system(size: .medium2))
                    Text(LocaleKeys.App.name)
                        .font(.headline)
                }
                HStack(spacing: .normal) {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: .medium2))
                    Text(LocaleKeys.Home.SideMenu.library)
                        .font(.headline)
                }
                HStack(spacing: .normal) {
                    Image(systemName: "square.grid.2x2")
                        .font(.system(size: .medium))
                    Text(LocaleKeys.Home.SideMenu.gpts)
                        .font(.headline)
                }.padding(.leading, .veryLow)
            }
            Spacer()
            HStack(spacing: .normal) {
                Text(LocaleKeys.Dummy.userName.prefix(1))
                    .font(.title3)
                    .padding(.normal)
                    .background(.thinMaterial)
                    .clipShape(.circle)
                Text(LocaleKeys.Dummy.userName)
                    .font(.title3)
            }
        }
        .padding(.horizontal, .low2)
        .frame(width: .dynamicWidth(width: 0.8))
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.background)
        .offset(x: isMenuOpen ? 0 : .dynamicWidth(width: -1))
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
