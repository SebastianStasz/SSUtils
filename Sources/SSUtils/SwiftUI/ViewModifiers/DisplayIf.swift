//
//  DisplayIf.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import SwiftUI

private struct DisplayIf: ViewModifier {

    private let condition: Bool

    init(_ condition: Bool) {
        self.condition = condition
    }

    func body(content: Content) -> some View {
        if condition { content }
    }
}

public extension View {

    /// Display the view if the condition is met.
    func displayIf(_ condition: Bool) -> some View {
        self.modifier(DisplayIf(condition))
    }
}
