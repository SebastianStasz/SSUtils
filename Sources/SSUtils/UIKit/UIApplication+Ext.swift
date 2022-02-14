//
//  UIApplication+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 14/02/2022.
//

import UIKit

public extension UIApplication {

    /// Returns the key window from `UIApplication.shared.connectedScenes`.
    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
