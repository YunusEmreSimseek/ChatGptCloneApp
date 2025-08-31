//
//  AIModel.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

enum AIModel: String, CaseIterable, Hashable {
    case gpt4_o = "gpt-4o"
    case gpt5 = "gpt-5"
    case gpt5_nano = "gpt-5-nano"
    case gpt5_chat = "gpt-5-chat"

    var displayValue: String {
        switch self {
        case .gpt4_o: return "4o"
        case .gpt5: return "5"
        case .gpt5_nano: return "5 \(LocaleKeys.Home.AIModelMenu.gpt5NanoTitle)"
        case .gpt5_chat: return "5 \(LocaleKeys.Home.AIModelMenu.gpt5ChatTitle)"
        }
    }

    var menuTitle: String {
        switch self {
        case .gpt4_o: return LocaleKeys.Home.AIModelMenu.gpt4oTitle
        case .gpt5: return LocaleKeys.Home.AIModelMenu.gpt5Title
        case .gpt5_nano: return LocaleKeys.Home.AIModelMenu.gpt5NanoTitle
        case .gpt5_chat: return LocaleKeys.Home.AIModelMenu.gpt5ChatTitle
        }
    }

    var menuDescription: String {
        switch self {
        case .gpt4_o: return ""
        case .gpt5: return LocaleKeys.Home.AIModelMenu.gpt5Description
        case .gpt5_nano: return LocaleKeys.Home.AIModelMenu.gpt5NanoDescription
        case .gpt5_chat: return LocaleKeys.Home.AIModelMenu.gpt5ChatDescription
        }
    }
}
