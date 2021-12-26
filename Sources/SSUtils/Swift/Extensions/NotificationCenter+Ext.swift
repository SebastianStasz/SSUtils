//
//  NotificationCenter+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 08/12/2021.
//

import UIKit

public extension NotificationCenter {

    /// Posted immediately prior to the display of the keyboard.
    static var keyboardWillShow: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    }

    /// Posted immediately prior to the dismissal of the keyboard.
    static var keyboardWillHide: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
    }

    /// Posted immediately after the display of the keyboard.
    static var keyboardDidShow: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)
    }

    /// Posted immediately after the dismissal of the keyboard.
    static var keyboardDidHide: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)
    }
}
