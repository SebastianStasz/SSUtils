//
//  Section+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 08/12/2021.
//

import SwiftUI

public extension Section where Parent == Text, Content: View, Footer == EmptyView {

    /// Creates Section with text header with given title.
    /// - Parameters:
    ///   - headerTitle: String value representing the header title of the section.
    init(_ headerTitle: String, content: @escaping () -> Content) {
        self.init(header: Text(headerTitle), content: content)
    }
}
