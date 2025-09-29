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
        guard !messages.isEmpty else { throw AIServiceError.emptyMessages }
        let chatMessages = convertToMessages(messages)
        let query = ChatQuery(
            messages: chatMessages,
            model: aiModel.rawValue,
            maxCompletionTokens: 1000
        )
        let result = try await openAI.chats(query: query)
        guard let choice = result.choices.first else { throw AIServiceError.noChoices }
        if let output = choice.message.content, !output.isEmpty {
            return output
        } else {
            throw AIServiceError.noContentInChoice
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
