//
//  ChatModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import Foundation

struct ChatModel: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var messages: [MessageModel]
    var aiModel: AIModel

    init(title: String = "", messages: [MessageModel] = [], aiModel: AIModel = .gpt5) {
        if !title.isEmpty {
            self.title = title
        } else {
            if let firstMessageText = messages.first?.text {
                self.title = firstMessageText.truncatedWords(limit: 40)
            } else {
                self.title = "New Chat"
            }
        }

        self.messages = messages
        self.aiModel = aiModel
    }
}

extension ChatModel {
    static let dummyChat = ChatModel(
        messages: .dummyConversation,
        aiModel: .gpt5
    )
    static let dummyChat2 = ChatModel(
        messages: .dummyConversation2,
        aiModel: .gpt5_chat
    )
    static let dummyChat3 = ChatModel(
        messages: .dummyConversation3,
        aiModel: .gpt4_o
    )
}

extension [ChatModel] {
    static let dummyChats = [
        ChatModel.dummyChat,
        ChatModel.dummyChat2,
        ChatModel.dummyChat3,
    ]
}
