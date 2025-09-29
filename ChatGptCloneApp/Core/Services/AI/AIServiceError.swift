//
//  AIServiceError.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 6.09.2025.
//

import Foundation

enum AIServiceError: Error {
    case emptyMessages
    case noChoices
    case noContentInChoice
    case timedOut
}
