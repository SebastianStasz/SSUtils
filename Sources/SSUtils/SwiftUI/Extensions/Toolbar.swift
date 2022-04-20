//
//  Toolbar.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import SwiftUI

public struct Toolbar {}

public extension Toolbar {

    /// Creates an ToolbarItem item which will be placed in navigationBarTrailing.
    /// - Parameters:
    ///   - systemImage: Name of the SFSymbol that repserents icon.
    ///   - isPresented: Boolean value indicating whether a ToolbarItem is presented.
    ///   - disabled: Boolean value indicating whether a ToolbarItem is disabled.
    ///   - action: Action that will be performed when user press the button.
    static func trailing(systemImage: String, isPresented: Bool = true, disabled: Bool = false, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(systemImage: systemImage, action: action)
                .disabled(disabled)
                .displayIf(isPresented)
        }
    }

    /// Creates an ToolbarItem item which will be placed in navigationBarLeading.
    /// - Parameters:
    ///   - systemImage: Name of the SFSymbol that repserents icon.
    ///   - isPresented: Boolean value indicating whether a ToolbarItem is presented.
    ///   - disabled: Boolean value indicating whether a ToolbarItem is disabled.
    ///   - action: Action that will be performed when user press the button.
    static func leading(systemImage: String, isPresented: Bool = true, disabled: Bool = false, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(systemImage: systemImage, action: action)
                .disabled(disabled)
                .displayIf(isPresented)
        }
    }

    /// Creates an ToolbarItem item which will be placed in keyboard.
    /// - Parameter content: The content of the toolbar item.
    static func keyboard<Content: View>(_ content: @escaping () -> Content) -> some ToolbarContent {
        ToolbarItem(placement: .keyboard, content: content)
    }
}
