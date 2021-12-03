//
//  Toolbar.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 06/11/2021.
//

import SwiftUI

public struct Toolbar {}

public extension Toolbar {
    static func trailing(systemImage: String, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(systemImage: systemImage, action: action())
        }
    }

    static func leading(systemImage: String, action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button(systemImage: systemImage, action: action())
        }
    }
}
