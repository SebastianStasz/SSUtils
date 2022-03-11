//
//  DisplayIf.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import SwiftUI

private struct DisplayIf: ViewModifier {

    private let condition: Bool
    private let transition: AnyTransition?

    init(_ condition: Bool, transition: AnyTransition?) {
        self.condition = condition
        self.transition = transition
    }

    func body(content: Content) -> some View {
        if let transition = transition {
            if condition { content.transition(transition) }
        } else {
            if condition { content }
        }
    }
}

public extension View {

    /// Display the view if the condition is met.
    func displayIf(_ condition: Bool, withTransition transition: AnyTransition? = nil) -> some View {
        self.modifier(DisplayIf(condition, transition: transition))
    }
}
