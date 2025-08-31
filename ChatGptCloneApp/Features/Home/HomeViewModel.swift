//
//  HomeViewModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

@Observable
final class HomeViewModel {
    var textInputValue: String = ""
    var isMenuOpen: Bool = false
    var messages: [MessageModel] = []
    var isLoading: Bool = false
    var selectedAIModel: AIModel = .gpt5

    private let _aiService: AIServiceProtocol

    init(aiService: AIServiceProtocol) {
        _aiService = aiService

        if AppMode.isPreview {
            messages = MessageModel.dummyConversation
        }
    }

    func sendMessage() async {
        guard !textInputValue.isEmpty else { return }
        messages.append(MessageModel(role: .user, text: textInputValue))
        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await _aiService.sendMessage(messages, selectedAIModel)
            textInputValue.removeAll()
            messages.append(MessageModel(role: .assistant, text: response))
        } catch {
            messages.append(MessageModel(role: .system, text: LocaleKeys.Error.regular))
        }
    }
}
