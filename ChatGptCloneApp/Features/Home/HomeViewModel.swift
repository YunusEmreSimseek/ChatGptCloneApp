//
//  HomeViewModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

@Observable
final class HomeViewModel {
    var exampleText: String = "hello brothers"
    var textInputValue: String = ""
    var isMenuOpen: Bool = false
    var messages: [MessageModel] = [.dummyMessage]
    var responseText: String = ""
    var isLoading: Bool = false

    private let _aiService: AIServiceProtocol

    init(aiService: AIServiceProtocol) {
        _aiService = aiService
    }

    func sendMessage() async {
        guard !textInputValue.isEmpty else { return }
        messages.append(MessageModel(role: .user, text: textInputValue))
        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await _aiService.sendMessage(textInputValue)
            messages.append(MessageModel(role: .assistant, text: response))
        } catch {
            messages.append(MessageModel(role: .system, text: "Error occurred while processing your request."))
        }
    }
}
