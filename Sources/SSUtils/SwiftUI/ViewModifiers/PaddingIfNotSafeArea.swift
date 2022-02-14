//
//  PaddingIfNotSafeArea.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import SwiftUI

private struct PaddingIfNotSafeArea: ViewModifier {
    @State private var isBottomSafeArea = false

    private let edge: Edge.Set
    private let value: CGFloat

    init(_ edge: Edge.Set = .all, _ value: CGFloat) {
        self.edge = edge
        self.value = value
    }

    func body(content: Content) -> some View {
        content.padding(edge, UIDevice.hasSafeArea ? .zero : value)
    }
}

public extension View {

    /// Adds the specified padding if the device has no safe area insets.
    func paddingIfNotSafeArea(_ edge: Edge.Set = .all, _ value: CGFloat) -> some View {
        modifier(PaddingIfNotSafeArea(edge, value))
    }
}
