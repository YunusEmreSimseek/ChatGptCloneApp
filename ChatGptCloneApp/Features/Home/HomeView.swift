//
//  HomeView.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init() {
        _viewModel = State(wrappedValue: .init(aiService: OpenAIService(), userDefaultsService: UserDefaultsService()))
    }

    var body: some View {
        @Bindable var vm = viewModel
        ZStack(alignment: .leading) {
            VStack(spacing: .dynamicHeight(height: 0.03)) {
                ScrollView {
                    MessagesList(messages: vm.selectedChat.messages)
                }
                .padding()

                if viewModel.selectedChat.messages.isEmpty {
                    SuggestionItems()
                }

                BottomChatInputBar(textInputValue: $vm.textInputValue, onSendMessage: vm.sendMessage)
            }

            if vm.isSideMenuOpen {
                Color.secondary
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            vm.isSideMenuOpen.toggle()
                        }
                    }
            }
            SideMenu(
                chats: vm.chats,
                selectedChat: $vm.selectedChat,
                isSideMenuOpen: vm.isSideMenuOpen
            ).animation(.easeInOut, value: vm.isSideMenuOpen)
        }
        .modifier(CenterLoadingViewModifier(isLoading: vm.isLoading))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                TopBarLeadingItems(
                    isSideMenuOpen: $vm.isSideMenuOpen,
                    selectedChat: $vm.selectedChat,
                    isPremiumUser: vm.isPremiumUser
                )
            }
            ToolbarItem(placement: .topBarTrailing) {
                TopBarTrailingItems(
                    showDeleteInformationDialog: $vm.showDeleteInformationDialog,
                    onCreateNewChat: vm.createNewChat,
                    saveChats: vm.saveChats
                )
            }

            if !vm.isPremiumUser && vm.selectedChat.messages.isEmpty {
                ToolbarItem(placement: .principal) {
                    UpgradeCard()
                }
            }
        }
        .confirmationDialog(LocaleKeys.Home.TrailingMenu.DeleteDialog.title, isPresented: $vm.showDeleteInformationDialog, titleVisibility: .visible, actions: {
            Button(LocaleKeys.Button.delete, role: .destructive) { vm.deleteChat() }
            Button(LocaleKeys.Button.cancel, role: .cancel) {}
        }, message: {
            Text(LocaleKeys.Home.TrailingMenu.DeleteDialog.message)
        })
    }
}

private struct MessagesList: View {
    let messages: [MessageModel]
    var body: some View {
        VStack(alignment: .leading, spacing: .normal) {
            ForEach(messages, id: \.self) { message in
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
}

#Preview {
    NavigationView {
        HomeView()
    }
}

private struct UpgradeCard: View {
    var body: some View {
        HStack(spacing: .zero) {
            Image(systemName: "sparkles")
            Text("Upgrade")
        }
        .foregroundStyle(.indigo)
        .padding(.veryLow)
        .rectThinCard(bgColor: .indigo.opacity(0.2))
    }
}
