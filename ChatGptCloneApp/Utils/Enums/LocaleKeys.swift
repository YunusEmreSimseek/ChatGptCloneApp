//
//  LocaleKeys.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import Foundation

enum LocaleKeys {
    enum Dummy {
        static let userName = "Yunus Emre Şimşek"
    }

    enum App {
        static let name = "ChatGPT"
    }

    enum Button {
        static let delete = "Delete"
        static let cancel = "Cancel"
        static let save = "Save"
    }

    enum Home {
        static let inputPlaceholder = "Type something..."
        enum TrailingMenu {
            static let share = "Share"
            static let rename = "Rename"
            static let report = "Report"
            static let archive = "Archive"

            enum DeleteDialog {
                static let title = "Delete Chat"
                static let message = "his can't be undone. Visit your settings to delete any memories saved during this chat."
            }
        }

        enum SideMenu {
            static let search = "Search"
            static let library = "Library"
            static let gpts = "GPT's"
        }

        enum AIModelMenu {
            static let legacyModelsTitle = "Legacy Models"
            static let aiDisplayFormat = "GPT-"
            static let gpt4oTitle = "GPT-4o"
            static let gpt4oDisplayValue = "GPT-4o"
            static let gpt5Title = "Auto"
            static let gpt5Description = "Decides how long to think"
            static let gpt5NanoTitle = "Instant"
            static let gpt5NanoDescription = "Answers right away"
            static let gpt5ChatTitle = "Thinking"
            static let gpt5ChatDescription = "Thinks longer for better answers"
        }
    }

    enum Error {
        static let regular = "Error occurred while processing your request."
    }
}
