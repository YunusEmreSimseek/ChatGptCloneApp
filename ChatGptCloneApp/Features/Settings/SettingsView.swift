//
//  SettingsView.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 6.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isSettingsOpen: Bool
    var body: some View {
        NavigationView {
            VStack {
                List {
                    AccountSection()
                    AppSection()
                    SpeechSection()
                    VoiceModeSection()
                    SuggestionsSection()
                    AboutSection()
                }
            }
            .navigationTitle(LocaleKeys.Settings.navTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    CloseButton(isPresented: $isSettingsOpen)
                }
            }
        }
    }
}

#Preview {
    SettingsView(isSettingsOpen: .constant(true))
}
