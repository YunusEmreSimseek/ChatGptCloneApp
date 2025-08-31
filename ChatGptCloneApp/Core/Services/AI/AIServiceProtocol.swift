//
//  AIServiceProtocol.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

protocol AIServiceProtocol {
    func sendMessage(_ messages: [MessageModel], _ aiModel: AIModel) async throws -> String
}
