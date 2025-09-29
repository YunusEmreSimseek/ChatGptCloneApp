//
//  GeoContainer.swift
//  ChatGptCloneApp
//
//  Created by Emre Simsek on 8.09.2025.
//

import SwiftUI

/// A container that provides its content with the size of the available space using GeometryReader.
struct GeoContainer<Content: View>: View {
    @ViewBuilder let content: (CGSize) -> Content
    init(
        @ViewBuilder content: @escaping (CGSize) -> Content

    ) {
        self.content = content
    }

    var body: some View {
        GeometryReader { geo in
            content(geo.size)
        }
    }
}

#Preview {
    GeoContainer { size in
        Text("Screen height: \(size.height)")
        Text("Screen width: \(size.width)")
        Text("------------------------------")
        Text("Screen height: \(UIScreen.main.bounds.size.height)")
        Text("Screen width: \(UIScreen.main.bounds.size.width)")
    }
}
