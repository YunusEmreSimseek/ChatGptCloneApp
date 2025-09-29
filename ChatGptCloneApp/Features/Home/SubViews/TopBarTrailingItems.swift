//
//  TopBarTrailingItems.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import SwiftUI

extension HomeView {
    struct TopBarTrailingItems: View {
        @Binding var showDeleteInformationDialog: Bool
        @Binding var isPremiumUser: Bool
        let onCreateNewChat: () -> Void
        let saveChats: () -> Void
        var body: some View {
            HStack {
                Button(action: {
                    withAnimation {
                        onCreateNewChat()
                    }
                }) {
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(.foreground)
                        .fontWeight(.medium)
                }
                Menu {
                    Button {} label: {
                        Label(LocaleKeys.Home.TrailingMenu.share, systemImage: "square.and.arrow.up")
                    }
                    Button {} label: {
                        Label(LocaleKeys.Home.TrailingMenu.rename, systemImage: "pencil")
                    }
                    Button {} label: {
                        Label(LocaleKeys.Home.TrailingMenu.report, systemImage: "flag")
                    }
                    Button {} label: {
                        Label(LocaleKeys.Home.TrailingMenu.archive, systemImage: "archivebox")
                    }
                    Button(role: .destructive) { withAnimation {
                        showDeleteInformationDialog = true
                    } } label: {
                        Label(LocaleKeys.Button.delete, systemImage: "trash")
                    }
                    Button { saveChats() } label: {
                        Label(LocaleKeys.Button.save, systemImage: "bookmark.fill")
                    }
                    Button { isPremiumUser.toggle() } label: {
                        Label(LocaleKeys.Home.TrailingMenu.premium, systemImage: isPremiumUser ? "person.fill" : "person")
                    }

                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.foreground)
                        .fontWeight(.medium)
                }
            }
        }
    }
}
