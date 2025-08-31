//
//  MessageModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

struct MessageModel: Equatable, Hashable {
    let id = UUID()
    var role: ChatRole
    var text: String
}

extension MessageModel {
    static let dummyUserMessage = MessageModel(role: .user, text: "Hello how are you ?")
    static let dummyAssistantMessage = MessageModel(role: .assistant, text: "Hi, i am fine how about you ?")
    static let dummyUserMessage2 = MessageModel(role: .user, text: "Thanks, i am very well too.")
    static let dummyConversation = [dummyUserMessage, dummyAssistantMessage, dummyUserMessage2]
}

enum ChatRole: String {
    case user
    case assistant
    case system
}
