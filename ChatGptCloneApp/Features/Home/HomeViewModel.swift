//
//  HomeViewModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

@MainActor
@Observable
final class HomeViewModel {
    var textInputValue: String = ""
    var isSideMenuOpen: Bool = false
    var isLoading: Bool = false
    var chats: [ChatModel] = []
    var selectedChat: ChatModel = .init()
    var showDeleteInformationDialog: Bool = false
    var isPremiumUser: Bool = false

    private let _aiService: AIServiceProtocol
    private let _userDefaultsService: IUserDefaultService

    init(aiService: AIServiceProtocol, userDefaultsService: IUserDefaultService) {
        _aiService = aiService
        _userDefaultsService = userDefaultsService

        if AppMode.isPreview {
            chats = .dummyChats
            if [ChatModel].dummyChats.first != nil {
                selectedChat = [ChatModel].dummyChats.first!
            }
        } else {
            guard let items: [ChatModel] = _userDefaultsService.getItem([ChatModel].self, forKey: .chats) else {
                return
            }
            chats = items
            if !items.isEmpty, items.first != nil {
                selectedChat = items.first!
            }
        }
    }

    func saveChats() {
        _userDefaultsService.saveItem(chats, forKey: .chats)
    }

    func deleteChat() {
        if let index = chats.firstIndex(of: selectedChat) {
            chats.remove(at: index)
        }
        if let firstChat = chats.first {
            selectedChat = firstChat
        } else {
            selectedChat = ChatModel()
            chats.append(selectedChat)
        }
    }

    func createNewChat() {
        selectedChat = ChatModel()
    }

    private func updateChat() {
        if let index = chats.firstIndex(where: { $0.id == selectedChat.id }) {
            chats[index] = selectedChat
        } else {
            let newChat = ChatModel(messages: selectedChat.messages, aiModel: selectedChat.aiModel)
            chats.append(newChat)
            selectedChat = newChat
        }
    }

    func sendMessage() async {
        guard !textInputValue.isEmpty else { return }
        selectedChat.messages.append(MessageModel(role: .user, text: textInputValue))

        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await _aiService.sendMessage(selectedChat.messages, selectedChat.aiModel)

            textInputValue.removeAll()
            selectedChat.messages.append(MessageModel(role: .assistant, text: response))

            updateChat()
        } catch {
            selectedChat.messages.append(MessageModel(role: .system, text: LocaleKeys.Error.regular))

            updateChat()
        }
    }
}
