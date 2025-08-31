//
//  AIServiceProtocol.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

protocol AIServiceProtocol {
    func sendMessage(_ message: String) async throws -> String
}
