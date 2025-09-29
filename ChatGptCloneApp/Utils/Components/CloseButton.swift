//
//  CloseButton.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 6.09.2025.
//

import SwiftUI

struct CloseButton: View {
    @Binding var isPresented: Bool

    var body: some View {
        Button {
            withAnimation(.easeInOut) {
                isPresented = false
            }
        } label: {
            Image.Buttons.close
                .symbolRenderingMode(.hierarchical)
                .foregroundStyle(Color.secondary)
        }
    }
}

#Preview {
    CloseButton(isPresented: .constant(true))
}
