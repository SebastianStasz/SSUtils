//
//  UINavigationController+Ext.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 19/03/2023.
//

import UIKit

public extension UINavigationController {
    /// Pops specified view controller with all above view controllers.
    /// - Parameters:
    ///   - viewController: The view controller to pop.
    ///   - animated: Pass true to animate the transition.
    func popViewControllers(upTo viewController: UIViewController, animated: Bool) {
        if viewController.isFirstInNavigationController {
            setViewControllers([], animated: animated)
        } else if let index = viewControllers.lastIndex(of: viewController) {
            let topViewController = viewControllers[index - 1]
            popToViewController(topViewController, animated: animated)
        }
    }
}
