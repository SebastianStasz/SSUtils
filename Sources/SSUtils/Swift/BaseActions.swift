//
//  BaseActions.swift
//  SSUtils
//
//  Created by Sebastian Staszczyk on 26/04/2022.
//

import Foundation

public protocol BaseActions: AnyObject {}

public extension BaseActions {
    func onSelf(_ action: @escaping (Self) -> Void) -> () -> Void {
        return { [weak self] in
            guard let strongSelf = self else {
                return
            }
            action(strongSelf)
        }
    }

    func onMainQueue(_ action: @escaping () -> Void) {
        DispatchQueue.main.async { action() }
    }
}
