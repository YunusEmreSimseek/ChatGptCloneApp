//
//  HomeView.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel = .init(aiService: OpenAIService(), userDefaultsService: UserDefaultsService())

    var body: some View {
        @Bindable var vm = viewModel
        GeoContainer { size in
            ZStack(alignment: .leading) {
                VStack(spacing: size.dynamicHeight(0.03)) {
                    ScrollView {
                        messagesList(vm.selectedChat.messages)
                    }
                    .padding()

                    if viewModel.selectedChat.messages.isEmpty {
                        suggestionItems
                    }

                    BottomChatInputBar(textInputValue: $vm.textInputValue, onSendMessage: vm.sendMessage)
                } // VStack

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
                    isSideMenuOpen: vm.isSideMenuOpen,
                    isSettingsOpen: $vm.isSettingsOpen
                ).animation(.easeInOut, value: vm.isSideMenuOpen)
            } // ZStack
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
                        isPremiumUser: $vm.isPremiumUser,
                        onCreateNewChat: vm.createNewChat,
                        saveChats: vm.saveChats
                    )
                }
                if !vm.isPremiumUser, vm.selectedChat.messages.isEmpty, !vm.isSideMenuOpen {
                    ToolbarItem(placement: .principal) {
                        upgradeCard()
                    }
                }
            } // toolbar
            .confirmationDialog(LocaleKeys.Home.TrailingMenu.DeleteDialog.title, isPresented: $vm.showDeleteInformationDialog, titleVisibility: .visible, actions: {
                Button(LocaleKeys.Button.delete, role: .destructive) { vm.deleteChat() }
                Button(LocaleKeys.Button.cancel, role: .cancel) {}
            }, message: {
                Text(LocaleKeys.Home.TrailingMenu.DeleteDialog.message)
            })
            .sheet(isPresented: $vm.isSettingsOpen, content: { SettingsView(isSettingsOpen: $vm.isSettingsOpen) })
        } // GeoContainer
    } // body
} // HomeView

extension HomeView {
    private func messagesList(_ messages: [MessageModel]) -> some View {
        VStack(alignment: .leading, spacing: .normal) {
            ForEach(messages, id: \.self) { message in
                if message.role == .user {
                    userMessageCard(message.text)
                } else if message.role == .assistant {
                    Text(message.text)
                } else {
                    Text(message.text)
                        .foregroundStyle(.red)
                }
            }
        }
    }

    private func userMessageCard(_ message: String) -> some View {
        HStack {
            Spacer()
            Text(message)
                .padding(.low)
                .rectThinCard()
                .frame(maxWidth: .dynamicWidth(width: 0.7), alignment: .trailing)
        }
    }

    private func upgradeCard() -> some View {
        HStack(spacing: .zero) {
            Image(systemName: "sparkles")
            Text("Upgrade")
        }
        .foregroundStyle(.indigo)
        .padding(.veryLow)
        .rectThinCard(bgColor: .indigo.opacity(0.2))
    }
}

#Preview {
    NavigationView {
        HomeView()
    }
}
