//
//  UIViewController+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 19/03/2023.
//

import UIKit

public extension UIViewController {
    /// A Boolean value indicating whether the view controller is first on the navigation stack.
    var isFirstInNavigationController: Bool {
        navigationController?.viewControllers.first === self
    }

    ///  Pops or dismisses a presented view controller.
    ///
    /// If the view controller is not embedded inside a navigation controller or is first on navigation controller stack then dismiss is performed.
    /// If the view controller is not first on navigation stack then view controller with all above view controllers on stack are popped.
    ///
    /// - Parameters:
    ///   - animated: Pass true to animate the transition.
    ///   - completion: The closure to execute after the view controller is dismissed.
    func popOrDismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        guard let navigationController else {
            dismissIfPresented(animated: animated, completion: completion)
            return
        }
        if isFirstInNavigationController {
            navigationController.dismissIfPresented(animated: animated, completion: completion)
        } else {
            navigationController.popViewControllers(upTo: self, animated: animated)
            completion?()
        }
    }
}

private extension UIViewController {
    func dismissIfPresented(animated: Bool, completion: (() -> Void)?) {
        guard let presentingViewController = presentingViewController else { return }
        presentingViewController.dismiss(animated: animated, completion: completion)
    }
}
