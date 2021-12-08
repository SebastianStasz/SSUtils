//
//  View+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 21/10/2021.
//

import SwiftUI

public extension View {

    // MARK: - Frame

    /// Positions this view within an invisible frame with infinite width and a specified maximum height.
    func infiniteWidth(maxHeight: CGFloat) -> some View {
        frame(maxWidth: .infinity, maxHeight: maxHeight)
    }

    /// Positions this view within an invisible frame with infinite width and a specified alignment.
    /// - Parameter alignment: The alignment of this view inside the resulting frame.
    func infiniteWidth(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, alignment: alignment)
    }

    // MARK: -

    /// Presents an alert with a message when a given condition is true using a string variable as a title.
    /// The Alert has one default button to close itself.
    /// - Parameters:
    ///   - title: A text string used as the title of the alert.
    ///   - isPresented: A binding to a Boolean value that determines whether to present the alert.
    ///   - message: A text string used as the message of the alert.
    func infoAlert(_ title: String = "Info", isPresented: Binding<Bool>, message: String) -> some View {
        alert(title, isPresented: isPresented, actions: {}, message: { Text(message) })
    }
}
