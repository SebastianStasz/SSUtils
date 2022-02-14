//
//  ScrollOffsetPreferenceKey.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import SwiftUI

public struct ScrollOffsetPreferenceKey: PreferenceKey {
    public static var defaultValue: CGPoint = .zero
    public static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
