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
    ///   - action: Action that will be performed when user press the button.
    static func trailing(systemImage: String, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(systemImage: systemImage, action: action())
        }
    }

    /// Creates an ToolbarItem item which will be placed in navigationBarLeading.
    /// - Parameters:
    ///   - systemImage: Name of the SFSymbol that repserents icon.
    ///   - action: Action that will be performed when user press the button.
    static func leading(systemImage: String, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(systemImage: systemImage, action: action())
        }
    }
}
