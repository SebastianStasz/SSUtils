//
//  Button+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 22/10/2021.
//

import SwiftUI

public extension Button where Label == Text {

    /// Creates a button that generates its label from a localized string.
    /// - Parameters:
    ///   - titleKey: The key for the button’s localized title, that describes the purpose of the button’s action.
    ///   - action: The action to perform when the user triggers the button.
    init(_ titleKey: String, action: @autoclosure @escaping () -> Void) {
        self.init(action: action) { Text(titleKey) }
    }

    /// Creates a button that generates its label from a localized string.
    /// - Parameters:
    ///   - titleKey: The key for the button’s localized title, that describes the purpose of the button’s action.
    ///   - action: The action to perform when the user triggers the button.
    init(_ titleKey: String, action: @escaping () -> Void) {
        self.init(action: action) { Text(titleKey) }
    }

    /// Creates a button that generates its label from a string.
    /// - Parameters:
    ///   - title: A string that describes the purpose of the button’s action.
    ///   - action: The action to perform when the user triggers the button.
    init<S>(_ title: S, action: @autoclosure @escaping () -> Void) where S : StringProtocol {
        self.init(action: action) { Text(title) }
    }
}

public extension Button where Label == Image {

    /// Creates a button that generates its label from a system image name.
    /// - Parameters:
    ///   - systemImage: The key of system graphics from the SF Symbols set.
    ///   - action: The action to perform when the user triggers the button.
    init(systemImage: String, action: @autoclosure @escaping () -> Void) {
        self.init(action: action) { Image(systemName: systemImage) }
    }
}
