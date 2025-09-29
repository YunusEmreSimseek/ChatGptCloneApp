//
//  LoadingBar.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 31.08.2025.
//

import SwiftUI

struct LoadingBar: View {
    let isLoading : Bool
    var body: some View {
        if isLoading {
            ProgressView().scaleEffect(1.5)
        }
        else {
            ProgressView().scaleEffect(0)
        }
    }
}
