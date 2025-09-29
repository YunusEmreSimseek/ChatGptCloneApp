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

    enum Settings {
        static let navTitle = "Settings"

        enum Account {
            static let title = "Account"
            static let email = "Email"
            static let phoneNumber = "Phone Number"
            static let subscription = "Subscribe"
            static let upgrade = "Upgrade to ChatGPT Pro"
            static let restorePruchases = "Restore Purchases"
            static let personalization = "Personalization"
            static let notifications = "Notifications"
            static let connectors = "Connectors"
            static let dataControls = "Data Controls"
            static let archivedChats = "Archived Chats"
            static let security = "Security"
        }

        enum App {
            static let language = "App Language"
            static let title = "App"
            static let dictation = "Auto Send with Dictation"
            static let appearance = "Appearance"
            static let color = "Accent Color"
            static let additionalModels = "Show additional models"
            static let haptic = "Haptic Feedback"
            static let spelling = "Correct Spelling Automatically"
            static let map = "Map Provider"
        }

        enum Speech {
            static let title = "Speech"
            static let mainLanguage = "Main Language"
            static let subTitle = "For best reuslts, select the language you mainly speak. If it's not listed, it may still be supported via auto-detection."
        }

        enum VoiceMode {
            static let title = "Voice Mode"
            static let voice = "Voice"
            static let backgroundConversations = "Background conversations"
            static let subTitle = "Background conversations keep the conversation going in other apps or while your screen is off. Learn more"
            static let subTitleLink = "Learn more"
            static let linkURL = "https://help.openai.com"
        }

        enum Suggestion {
            static let title = "Suggestions"
            static let autocomplete = "Autocomplete"
            static let trendingSearches = "Trending Searches"
            static let followSuggestions = "Follow-up Suggestions"
        }

        enum About {
            static let title = "About"
            static let helpCenter = "Help Center"
            static let terms = "Terms of Use"
            static let privacyPolicy = "Privacy Policy Center"
            static let version = "ChatGPT for iOS"
        }
    }

    enum Home {
        static let inputPlaceholder = "Type something..."
        enum TrailingMenu {
            static let share = "Share"
            static let rename = "Rename"
            static let report = "Report"
            static let archive = "Archive"
            static let premium = "Premium"

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
