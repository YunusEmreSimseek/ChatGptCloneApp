//
//  UserMessageCard.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 1.09.2025.
//

import SwiftUI

struct UserMessageCard: View {
    let message: String
    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .padding(.low)
                .rectThinCard()
                .frame(maxWidth: .dynamicWidth(width: 0.7), alignment: .trailing)
        }
    }
}
