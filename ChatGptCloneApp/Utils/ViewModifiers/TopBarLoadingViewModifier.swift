//
//  TopBarLoadingViewModifier.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

struct TopBarLoadingViewModifier: ViewModifier {
    var isLoading: Bool
    func body(content: Content) -> some View {
        return
            content
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        LoadingBar(isLoading: isLoading)
                    }
                }
    }
}
