//
//  DisplayIf.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import SwiftUI

struct DisplayIf: ViewModifier {

    var condition: Bool

    func body(content: Content) -> some View {
        if condition { content }
    }
}

public extension View {
    func displayIf(_ condition: Bool) -> some View {
        self.modifier(DisplayIf(condition: condition))
    }
}
