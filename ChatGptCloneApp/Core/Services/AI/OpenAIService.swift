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

    func sendMessage(_ messages: [MessageModel], _ aiModel: AIModel) async throws -> String {
        let chatMessages = convertToMessages(messages)
        let query = ChatQuery(
            messages: chatMessages,
            model: aiModel.rawValue,
            maxCompletionTokens: 200
        )
        let result = try await openAI.chats(query: query)
        if let output = result.choices.first?.message.content {
            return output
        } else {
            return "⚠️ No Response"
        }
    }

    private func convertToMessages(_ messages: [MessageModel]) -> [ChatQuery.ChatCompletionMessageParam] {
        var chatMessages: [ChatQuery.ChatCompletionMessageParam] = []
        let lastMessages = messages.suffix(5)
        for message in lastMessages {
            if message.role == .user {
                let chatMessage = ChatQuery.ChatCompletionMessageParam(role: .user, content: message.text)
                chatMessages.append(chatMessage!)
            } else if message.role == .assistant {
                let chatMessage = ChatQuery.ChatCompletionMessageParam(role: .assistant, content: message.text)
                chatMessages.append(chatMessage!)
            } else {
                let chatMessage = ChatQuery.ChatCompletionMessageParam(role: .system, content: message.text)
                chatMessages.append(chatMessage!)
            }
        }
        return chatMessages
    }
}
