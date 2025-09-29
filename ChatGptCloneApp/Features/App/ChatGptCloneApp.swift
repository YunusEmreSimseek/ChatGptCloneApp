//
//  ChatGptCloneApp.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

@main
struct ChatGptCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

private struct RootView: View {
//    @State private var isReady = false
//    let startup = StartupManager()
    var body: some View {
        NavigationStack {
            HomeView()
//                .task {
//                    await startup.run()
//                }
        }
    }
}

// actor StartupManager {
//    private let _userDefaultsService: IUserDefaultService
//    init(userDefaultsService: IUserDefaultService = UserDefaultsService()) {
//        _userDefaultsService = userDefaultsService
//    }
//
//    func run() async {
//        let items = _userDefaultsService.getItem([ChatModel].self, forKey: .chats)
//    }
// }
