//
//  SettingsSubViews.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 8.09.2025.
//
import SwiftUI

extension SettingsView {
    struct AccountSection: View {
        var body: some View {
            Section(LocaleKeys.Settings.Account.title) {
                detailItem("envelope", LocaleKeys.Settings.Account.email, "test@test.com")
                detailItem("phone", LocaleKeys.Settings.Account.phoneNumber, "+905555555555")
                detailItem("plus", LocaleKeys.Settings.Account.subscription, "ChatGPT Plus")
                imageText("star", LocaleKeys.Settings.Account.upgrade)
                imageText("arrow.clockwise", LocaleKeys.Settings.Account.restorePruchases)
                navItem("person.badge.shield.checkmark", LocaleKeys.Settings.Account.personalization) {}
                navItem("bell", LocaleKeys.Settings.Account.notifications) {}
                navItem("circle.grid.2x2", LocaleKeys.Settings.Account.connectors) {}
                navItem("cylinder.split.1x2", LocaleKeys.Settings.Account.dataControls) {}
                navItem("archivebox", LocaleKeys.Settings.Account.archivedChats) {}
                navItem("shield", LocaleKeys.Settings.Account.security) {}
            }
        }
    }

    struct AppSection: View {
        var body: some View {
            Section(LocaleKeys.Settings.App.title) {
                navItem("globe", LocaleKeys.Settings.App.language, "English") {}
                switcherItem("mic", LocaleKeys.Settings.App.dictation, .constant(false))
                menuItem("moon", LocaleKeys.Settings.App.appearance, "System")
                menuItem("paintbrush", LocaleKeys.Settings.App.color, "Default")
                switcherItem("square.split.2x2", LocaleKeys.Settings.App.additionalModels, .constant(false))
                switcherItem("iphone.radiowaves.left.and.right", LocaleKeys.Settings.App.haptic, .constant(true))
                switcherItem("character", LocaleKeys.Settings.App.spelling, .constant(true))
                menuItem("map", LocaleKeys.Settings.App.map, "Apple Maps")
            }
        }
    }

    struct SpeechSection: View {
        var body: some View {
            Section(LocaleKeys.Settings.Speech.title) {
                menuItem("globe", LocaleKeys.Settings.Speech.mainLanguage)
                Text(LocaleKeys.Settings.Speech.subTitle)
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .listRowBackground(Color.clear)
            }
        }
    }

    struct VoiceModeSection: View {
        var learnMoreText: AttributedString {
            var text = AttributedString(LocaleKeys.Settings.VoiceMode.subTitle)
            if let range = text.range(of: LocaleKeys.Settings.VoiceMode.subTitleLink) {
                text[range].foregroundColor = .primary
                text[range].link = URL(string: LocaleKeys.Settings.VoiceMode.linkURL)!
            }
            return text
        }

        var body: some View {
            Section(LocaleKeys.Settings.VoiceMode.title) {
                navItem("waveform", LocaleKeys.Settings.VoiceMode.voice, "Maple") {}
                switcherItem("message.and.waveform", LocaleKeys.Settings.VoiceMode.backgroundConversations, .constant(false))
                Text(learnMoreText)
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .listRowBackground(Color.clear)
            }
        }
    }

    struct SuggestionsSection: View {
        var body: some View {
            Section(LocaleKeys.Settings.Suggestion.title) {
                switcherItem("pencil.and.outline", LocaleKeys.Settings.Suggestion.autocomplete, .constant(true))
                switcherItem("arrow.up.forward", LocaleKeys.Settings.Suggestion.trendingSearches, .constant(true))
                switcherItem("text.append", LocaleKeys.Settings.Suggestion.trendingSearches, .constant(true))
            }
        }
    }

    struct AboutSection: View {
        var body: some View {
            Section(LocaleKeys.Settings.About.title) {
                imageText("questionmark.circle", LocaleKeys.Settings.About.helpCenter)
                imageText("text.book.closed", LocaleKeys.Settings.About.terms)
                imageText("exclamationmark.lock", LocaleKeys.Settings.About.privacyPolicy)
                detailItem("circle.fill", LocaleKeys.Settings.About.version, "1.2025.232 ")
            }
        }
    }
}

extension SettingsView {
    private static let iconHeight: CGFloat = .dynamicHeight(height: 0.022)
    private static let iconWidth: CGFloat = .dynamicWidth(width: 0.05)

    private static func detailItem(_ iconName: String, _ title: String, _ subtitle: String) -> some View {
        HStack {
            imageText(iconName, title)
            Spacer(minLength: .low)
            Text(verbatim: subtitle)
                .foregroundStyle(.secondary)
        }
    }

    private static func navItem(_ iconName: String, _ title: String, _ subtitle: String? = nil, _ action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                imageText(iconName, title)
                Spacer()
                if subtitle != nil {
                    Text(verbatim: subtitle!)
                        .foregroundStyle(Color.secondary)
                }
                Image(systemName: "chevron.right")
                    .imageScale(.small)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.secondary)
            }
        }
    }

    private static func switcherItem(_ iconName: String, _ title: String, _ isOn: Binding<Bool>) -> some View {
        HStack {
            imageText(iconName, title)
            Spacer()
            Toggle(isOn: isOn) {}
        }
    }

    @ViewBuilder
    private static func menuItem(_ iconName: String, _ title: String, _ menuTitle: String? = nil) -> some View {
        @State var selectedMenuItem: String? = nil
        HStack {
            imageText(iconName, title)
            Spacer()
            Menu(menuTitle ?? "") {
                Text("Test ")
                Text("Test ")
            }
            .foregroundStyle(.secondary)
            Image(systemName: "chevron.up.chevron.down")
                .imageScale(.small)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
        }
    }

    private static func imageText(_ iconName: String, _ title: String) -> some View {
        HStack(spacing: .low) {
            Image(systemName: iconName)
                .font(.system(size: 19))
                .fontWeight(.medium)
                .symbolRenderingMode(.monochrome)
                .frame(width: iconWidth)

            Text(title)
        }.foregroundStyle(.foreground)
    }
}
