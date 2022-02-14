//
//  SizePreferenceKey.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import SwiftUI

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value _: inout CGSize, nextValue: () -> CGSize) {}
}
