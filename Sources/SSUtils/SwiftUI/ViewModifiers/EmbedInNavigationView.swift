//
//  EmbedInNavigationView.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 21/10/2021.
//

import SwiftUI

private struct EmbedInNavigationView: ViewModifier {

    let title: String?
    let displayMode: NavigationBarItem.TitleDisplayMode

    func body(content: Content) -> some View {
        NavigationView {
            if let title = title {
                content
                    .navigationTitle(LocalizedStringKey(title))
                    .navigationBarTitleDisplayMode(displayMode)
            } else {
                content
            }
        }
    }
}

public extension View {

    /// Embed the view in the navigation view with optional title and specified display mode.
    /// - Parameters:
    ///   - title: Configures the view’s title for purposes of navigation, using a localized string.
    ///   - displayMode: Configures the title display mode for navigation view.
    func embedInNavigationView(title: String? = nil, displayMode: NavigationBarItem.TitleDisplayMode = .automatic) -> some View {
        self.modifier(EmbedInNavigationView(title: title, displayMode: displayMode))
    }
}
