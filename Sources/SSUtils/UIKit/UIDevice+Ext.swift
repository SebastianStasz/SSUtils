//
//  UIDevice+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import UIKit

public extension UIDevice {

    /// Returns `true` if the key window has a nonzero bottom safe area inset.
    static var hasSafeArea: Bool {
        (UIApplication.keyWindow?.safeAreaInsets.bottom ?? 0) > 0
    }
}
