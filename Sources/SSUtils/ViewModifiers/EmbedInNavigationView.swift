//
//  EmbedInNavigationView.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 21/10/2021.
//

import SwiftUI

struct EmbedInNavigationView: ViewModifier {

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
    func embedInNavigationView(title: String? = nil, displayMode: NavigationBarItem.TitleDisplayMode = .automatic) -> some View {
        self.modifier(EmbedInNavigationView(title: title, displayMode: displayMode))
    }
}
