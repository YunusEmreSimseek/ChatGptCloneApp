//
//  OpenAIService.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation
import OpenAI

final class OpenAIService: AIServiceProtocol {
    private let openAI: OpenAI

    init(apiKey: String = SecretsManager.getAPIKey(.OPENAI_API_KEY)) {
        openAI = .init(apiToken: apiKey)
    }

    func sendMessage(_ message: String) async throws -> String {
        let chatMessage = ChatQuery.ChatCompletionMessageParam(role: .user, content: message)
        let query = ChatQuery(
            messages: [chatMessage!],
            model: .gpt4_o,
            maxCompletionTokens: 200
        )
        let result = try await openAI.chats(query: query)
        if let output = result.choices.first?.message.content {
            return output
        } else {
            return "⚠️ No Response"
        }
    }

//    private func convertToMessages(_ messages: [String]) -> [ChatQuery.ChatCompletionMessageParam] {
//        var chatMessages: [ChatQuery.ChatCompletionMessageParam] = []
//        let lastMessages = messages.suffix(5)
//        return chatMessages
//    }
}
