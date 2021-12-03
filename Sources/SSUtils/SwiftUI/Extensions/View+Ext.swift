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
        self.frame(maxWidth: .infinity, maxHeight: maxHeight)
    }

    /// Positions this view within an invisible frame with infinite width and a specified alignment.
    /// - Parameter alignment: The alignment of this view inside the resulting frame.
    func infiniteWidth(alignment: Alignment = .center) -> some View {
        self.frame(maxWidth: .infinity, alignment: alignment)
    }
}
