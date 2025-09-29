//
//  MessageModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

struct MessageModel: Equatable, Hashable, Codable {
    var id = UUID()
    var role: ChatRole
    var text: String
}

extension MessageModel {
    static let dummyUserMessage = MessageModel(role: .user, text: "Hello how are you ?")
    static let dummyAssistantMessage = MessageModel(role: .assistant, text: "Hi, i am fine how about you ?")
    static let dummyUserMessage2 = MessageModel(role: .user, text: "Thanks, i am very well too.")

    static let dummyUserMessage3 = MessageModel(role: .user, text: "I want to learn something about the SwiftUI.")
    static let dummyAssistantMessage2 = MessageModel(role: .assistant, text: "Got it 🙂 Since you want to learn about SwiftUI, I’ll give you a clear, structured roadmap to understand the basics and start building apps effectively.")
    static let dummyUserMessage4 = MessageModel(role: .user, text: "Thanks, it is going to be very helpful.")

    static let dummyUserMessage5 = MessageModel(role: .user, text: "What is the best sport ?")
    static let dummyAssistantMessage3 = MessageModel(role: .assistant, text: "There isn’t a single “best” sport universally — it really depends on what you’re looking for. Here’s a quick breakdown based on different goals.")
}

extension [MessageModel] {
    static let dummyConversation = [MessageModel.dummyUserMessage, MessageModel.dummyAssistantMessage, MessageModel.dummyUserMessage2]
    static let dummyConversation2 = [MessageModel.dummyUserMessage3, MessageModel.dummyAssistantMessage2, MessageModel.dummyUserMessage4]
    static let dummyConversation3 = [MessageModel.dummyUserMessage5, MessageModel.dummyAssistantMessage3]
}

enum ChatRole: String, Codable {
    case user
    case assistant
    case system
}
