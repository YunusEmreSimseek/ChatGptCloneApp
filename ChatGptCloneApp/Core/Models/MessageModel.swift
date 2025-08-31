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
    static let dummyMessage = MessageModel(role: .user, text: "Hello how are you ?")
}

enum ChatRole: String {
    case user
    case assistant
    case system
}
