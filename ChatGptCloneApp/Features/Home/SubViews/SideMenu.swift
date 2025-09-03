//
//  SideMenu.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import SwiftUI

struct SideMenu: View {
    let chats: [ChatModel]
    @Binding var selectedChat: ChatModel
    let isSideMenuOpen: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: .dynamicHeight(height: 0.04)) {
                HStack(alignment: .center) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.secondary)
                            .font(.title3)
                        TextField(LocaleKeys.Home.SideMenu.search, text: .constant(""))
                            .padding(.vertical, .low)
                    }
                    .padding(.horizontal, .low3)
                    .rectThinCard()

                    Spacer()

                    Button {} label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundStyle(.foreground)
                            .font(.title)
                            .padding(.bottom, .veryLow)
                    }
                }
                VStack(alignment: .leading, spacing: .normal) {
                    HStack(spacing: .normal) {
                        Image(systemName: "aqi.high")
                            .font(.system(size: .medium2))
                        Text(LocaleKeys.App.name)
                            .font(.headline)
                    }
                    HStack(spacing: .normal) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.system(size: .medium2))
                        Text(LocaleKeys.Home.SideMenu.library)
                            .font(.headline)
                    }
                    HStack(spacing: .normal) {
                        Image(systemName: "square.grid.2x2")
                            .font(.system(size: .medium))
                        Text(LocaleKeys.Home.SideMenu.gpts)
                            .font(.headline)
                    }
                    .padding(.leading, .veryLow)
                }

                VStack(spacing: .zero) {
                    ForEach(chats) { chat in
                        Button {
                            withAnimation {
                                selectedChat = chat
                            }
                        } label: {
                            Text(chat.title)
                                .padding(.low)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .if(selectedChat == chat) { view in
                                    view.background(.thinMaterial)
                                }
                                .clipShape(.rect(cornerRadius: .low))
                                .foregroundStyle(.foreground)
                        }
                    }
                }
            }
            Spacer()
            HStack(spacing: .normal) {
                Text(LocaleKeys.Dummy.userName.prefix(1))
                    .font(.title3)
                    .padding(.normal)
                    .circleCard()
                Text(LocaleKeys.Dummy.userName)
                    .font(.title3)
            }
        }
        .padding(.trailing, .low)
        .frame(width: .dynamicWidth(width: 0.8))
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.background)
        .offset(x: isSideMenuOpen ? 0 : .dynamicWidth(width: -1))
    }
}
